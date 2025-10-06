import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Banyumas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const WisataPage(),
    );
  }
}

class WisataPage extends StatelessWidget {
  const WisataPage({super.key});

  // Data tempat wisata (pakai asset)
  final List<Map<String, String>> wisataList = const [
    {
      "nama": "Baturraden",
      "gambar": "assets/images/baturraden.jpg",
      "deskripsi":
          "Wisata alam populer di lereng Gunung Slamet, terkenal dengan udara sejuk, pemandangan indah, dan berbagai wahana keluarga."
    },
    {
      "nama": "Curug Cipendok",
      "gambar": "assets/images/curug_cipendok.jpg",
      "deskripsi":
          "Air terjun megah setinggi 92 meter yang dikelilingi hutan lebat, cocok untuk pecinta alam dan petualangan."
    },
    {
      "nama": "Telaga Sunyi",
      "gambar": "assets/images/telaga_sunyi.jpg",
      "deskripsi":
          "Telaga dengan air jernih dan suasana tenang di tengah hutan, cocok untuk relaksasi dan healing."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rekomendasi Wisata Banyumas"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    wisata["gambar"]!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wisata["nama"]!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        wisata["deskripsi"]!,
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
