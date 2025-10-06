import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: Text("Pertemuan 2")),
      body: GridView. count( 
        crossAxisCount: 2, 
        children: [
          Text ("Hello"), 
          Text ("Yoga"),
          Text ("Eka"),
          Text ("Pratama"), 
          Container(color: Colors.amberAccent,),
          Container(color: Colors.white24,)
        ],
      ),
      // body: Center(child: Image.asset("assets/logo.png")),
    );
  }
}
