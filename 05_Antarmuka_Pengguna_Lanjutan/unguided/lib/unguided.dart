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
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const WisataPage(),
    );
  }
}

class WisataPage extends StatelessWidget {
  const WisataPage({super.key});

  // Data tempat wisata
  final List<Map<String, String>> wisataList = const [
    {
      "nama": "Baturraden",
      "gambar": "assets/baturaden.jpeg",
      "deskripsi":
          "Wisata alam populer di lereng Gunung Slamet dengan udara sejuk, pemandangan indah, dan wahana keluarga yang seru.",
    },
    {
      "nama": "Curug Cipendok",
      "gambar": "assets/cipendok.jpeg",
      "deskripsi":
          "Air terjun setinggi 92 meter yang megah, dikelilingi hutan tropis yang menenangkan dan alami.",
    },
    {
      "nama": "Telaga Sunyi",
      "gambar": "assets/telaga.jpeg",
      "deskripsi":
          "Telaga dengan air sebening kristal, dikelilingi pepohonan rindang—tempat sempurna untuk healing.",
    },
    {
      "nama": "Museum Banyumas",
      "gambar": "assets/museum.j",
      "deskripsi":
          "Destinasi edukatif dengan koleksi sejarah Banyumas dan budaya lokal yang menarik untuk dikunjungi.",
    },
    {
      "nama": "Alun-Alun Purwokerto",
      "gambar": "assets/alunalun.jpg",
      "deskripsi":
          "Pusat kota yang ramai, tempat bersantai sambil menikmati kuliner khas Banyumas di malam hari.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Rekomendasi Wisata Banyumas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/underpas.jpg', // kamu bisa ganti gambar ini
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black.withOpacity(0.3)),
                ],
              ),
            ),
            backgroundColor: Colors.green[700],
          ),

          // SliverList
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final wisata = wisataList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.asset(
                            wisata["gambar"]!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Nama & Deskripsi
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wisata["nama"]!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                wisata["deskripsi"]!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.green,
                                        size: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "Banyumas, Jawa Tengah",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[700],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.explore,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      "Jelajahi",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: wisataList.length),
            ),
          ),
        ],
      ),
    );
  }
}
