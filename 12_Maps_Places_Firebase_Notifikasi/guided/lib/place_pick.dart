import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class PlacePick extends StatefulWidget {
  const PlacePick({super.key});

  @override
  State<PlacePick> createState() => _PlacePickState();
}

class _PlacePickState extends State<PlacePick> {
  static final LatLng _defaultLocation = LatLng(
    -7.435082695992093,
    109.24926816292763,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlacePicker(
        apiKey: "AIzaSyAhLKzV0RnTmIyg1LM3Gbo62tucGfuZTn8",
        initialLocation: _defaultLocation,
      ),
    );
  }
}