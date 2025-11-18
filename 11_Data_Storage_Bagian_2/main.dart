import 'package:flutter/material.dart';
import 'package:unguided/connection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Connection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  insertData({
                    "judul": "3726MDPL",
                    "penulis": "Nurwina Sari",
                    "tahun_terbit": "2024",
                    "genre": "Romance",
                  });
                },
                child: const Text("Tambah Data"),
              ),
              ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: const Text("Lihat Data"),
              ),
              ElevatedButton(
                onPressed: () {
                  updateData({
                    "id": "",
                    "tahun_terbit": "2025",
                    "genre": "SOL",
                  });
                },
                child: const Text("Update Data"),
              ),
              ElevatedButton(
                onPressed: () {
                  deleteData("f40f6591-fda2-49eb-93dd-569f5e06d095");
                },
                child: const Text("Hapus Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}