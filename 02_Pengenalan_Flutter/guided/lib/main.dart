import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomepage(), title: "Pertemuan 2");
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 181, 255),
        title: Text("Pertemuan 2"),
      ),
      body: Column(
        children: [
          Text("Hello World"),
          Text("Hello Gilang"),
          Container(
            color: Colors.deepPurple,
            height: 200,
          ),
          Container(
            color: const Color.fromARGB(255, 243, 243, 0),
            height: 200,
          ),
          SizedBox(height: 20),
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 50,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text("How Your Today?"),
          ),
          Center(
            child: Text(
              "Tegar Kang Ageng Gilang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

