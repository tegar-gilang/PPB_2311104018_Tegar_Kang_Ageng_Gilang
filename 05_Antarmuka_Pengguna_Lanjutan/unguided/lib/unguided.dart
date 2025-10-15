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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)), // Emerald green
      ),
      home: const WisataPage(),
    );
  }
}

class WisataPage extends StatelessWidget {
  const WisataPage({super.key});

  final List<Map<String, String>> wisataList = const [
    {
      "nama": "Baturraden",
      "gambar": "assets/caub.jpg",
      "deskripsi":
          "Wisata alam populer di lereng Gunung Slamet dengan udara sejuk, pemandangan indah, dan wahana keluarga yang seru.",
    },
    {
      "nama": "Curug Cipendok",
      "gambar": "assets/cipendok.jpg",
      "deskripsi":
          "Air terjun setinggi 92 meter yang megah, dikelilingi hutan tropis yang menenangkan dan alami.",
    },
    {
      "nama": "Telaga Sunyi",
      "gambar": "assets/telaga.jpg",
      "deskripsi":
          "Telaga dengan air sebening kristal, dikelilingi pepohonan rindang—tempat sempurna untuk healing.",
    },
    {
      "nama": "Museum Banyumas",
      "gambar": "assets/museum.jpg",
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
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth * 0.55;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // HEADER MEWAH
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            backgroundColor: const Color(0xFF1B5E20),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                "✨ Wisata Banyumas ✨",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.2,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/underpas.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black38,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // DAFTAR TEMPAT WISATA
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final wisata = wisataList[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    margin: const EdgeInsets.only(bottom: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar dengan overlay gradasi
                          Stack(
                            children: [
                              Image.asset(
                                wisata["gambar"]!,
                                width: double.infinity,
                                height: imageHeight,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: imageHeight,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.5),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 16,
                                child: Text(
                                  wisata["nama"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54,
                                        offset: Offset(1, 1),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Deskripsi elegan
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  wisata["deskripsi"]!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[800],
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xFF1B5E20),
                                          size: 18,
                                        ),
                                        SizedBox(width: 6),
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
                                        backgroundColor:
                                            const Color(0xFF1B5E20),
                                        foregroundColor: Colors.white,
                                        elevation: 3,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 10,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                      ),
                                      icon: const Icon(Icons.explore),
                                      label: const Text("Jelajahi"),
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
                },
                childCount: wisataList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
