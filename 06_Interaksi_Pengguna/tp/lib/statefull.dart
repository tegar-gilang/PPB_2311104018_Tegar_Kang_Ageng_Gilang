import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FontCounterPage(),
    );
  }
}

class FontCounterPage extends StatefulWidget {
  const FontCounterPage({super.key});

  @override
  State<FontCounterPage> createState() => _FontCounterPageState();
}

class _FontCounterPageState extends State<FontCounterPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Interaksi Pengguna - Fonts")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: GoogleFonts.firaCode(
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Text('Tambah'),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Ini Fira Code',
              style: GoogleFonts.firaCode(
                fontWeight: FontWeight.w600,
                fontSize: 24.0,
              ),
            ),
          ),
          Center(
            child: Text(
              'Ini Inter!',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
