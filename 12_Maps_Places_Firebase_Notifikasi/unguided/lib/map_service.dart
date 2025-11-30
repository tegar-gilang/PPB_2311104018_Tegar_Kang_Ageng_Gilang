import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'location_service.dart';
import 'search_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapboxMap? mapboxMap;
  LatLng? userLocation;

  final searchService = SearchService();
  final locationService = LocationService();

  List<dynamic> searchResults = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    requestPermission();
    _loadUserPosition();
  }

  Future<void> requestPermission() async {
    var status = await Permission.location.request();
    if (status.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> _loadUserPosition() async {
    final pos = await locationService.getUserPosition();
    setState(() {
      userLocation = LatLng(pos.latitude, pos.longitude);
    });
  }

  void _onMapCreated(MapboxMap controller) {
    mapboxMap = controller;

    if (userLocation != null) {
      mapboxMap!.flyTo(
        CameraOptions(
          center: userLocation!,
          zoom: 14.0,
        ),
        MapAnimationOptions(duration: 1000),
      );
    }
  }

  Future<void> _search() async {
    final result = await searchService.searchLocation(query);
    setState(() {
      searchResults = result;
    });
  }

  void _goToPlace(dynamic place) {
    final coords = place["geometry"]["coordinates"];
    final lat = coords[1];
    final lng = coords[0];

    mapboxMap!.flyTo(
      CameraOptions(
        center: LatLng(lat, lng),
        zoom: 15,
      ),
      MapAnimationOptions(duration: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                MapWidget(
                  key: const ValueKey("mapWidget"),
                  onMapCreated: _onMapCreated,
                  cameraOptions: CameraOptions(
                    center: userLocation!,
                    zoom: 14,
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: TextField(
                    onChanged: (v) => query = v,
                    onSubmitted: (_) => _search(),
                    decoration: InputDecoration(
                      hintText: "Cari tempat...",
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                if (searchResults.isNotEmpty)
                  Positioned(
                    top: 120,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (_, i) {
                          final place = searchResults[i];
                          return ListTile(
                            title: Text(place["place_name"]),
                            onTap: () {
                              _goToPlace(place);
                              setState(() {
                                searchResults = [];
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
