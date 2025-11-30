import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RenderMaps extends StatefulWidget {
  const RenderMaps({super.key});

  @override
  State<RenderMaps> createState() => _RenderMapsState();
}

class _RenderMapsState extends State<RenderMaps> {
static final LatLng _defaultLocation = LatLng(
  -7.435082695992093,
  109.24926816292763,
);

  static final CameraPosition _cameraPosition = CameraPosition(target: _defaultLocation, zoom: 15);

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId(
          "Telkom"
        ),
        position: _defaultLocation
      ),
      Marker(
        markerId: MarkerId(
          "andhang"
        ),
        position: LatLng(-7.43190925639116, 109.24648323415568)
      )
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Google Maps"
        ),
      ),
      body: GoogleMap(initialCameraPosition: _cameraPosition, markers: _createMarker(),),
    );
  }
}