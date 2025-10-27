import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

Future<void> loadJsonData() async {
  final String response = await rootBundle.loadString('assets/identitas.json');
  final data = await json.decode(response);

  print(data); // print or use your JSON data here
  Identitas Album = Identitas.fromJSON(data);
  print(Album.user_id);
}

class Identitas {
  final int user_id;
  final int id;
  final String title;

  const Identitas ({
    required this.user_id,
    required this.id,
    required this.title
  });

  factory Identitas.fromJSON(Map<String, dynamic> json) {
    return Identitas(
      user_id: json['user_id'], 
      id: json['id'], 
      title: json['title']
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    loadJsonData();
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text(
              "NOW OR NEVER"
            )
          ],
        ),
      ),
    );
  }
}