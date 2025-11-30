import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'map_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set Mapbox Access Token
  MapboxOptions.setAccessToken(
    "MASUKKAN_MAPBOX_ACCESS_TOKEN_KAMU",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mapbox Flutter",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MapScreen(),   // <--- dari map_service.dart
    );
  }
}
