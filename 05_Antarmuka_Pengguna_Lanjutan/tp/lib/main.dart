import 'package:flutter/material.dart';

void main() {
  runApp(const WisataPurwokertoApp());
}

class WisataPurwokertoApp extends StatelessWidget {
  const WisataPurwokertoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visit Banyumas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const VisitPurwokertoPage(),
    );
  }
}

class VisitPurwokertoPage extends StatelessWidget {
  const VisitPurwokertoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> wisataList = [
      {
        'image': 'assets/btr.jpg',
        'title': 'Baturaden',
        'desc':
            'Destinasi paling populer di kaki Gunung Slamet, dengan udara sejuk dan panorama pegunungan yang menenangkan.',
      },
      {
        'image': 'assets/cipendok.jpg',
        'title': 'Curug Cipendok',
        'desc':
            'Air terjun megah setinggi 92 meter yang tersembunyi di tengah hutan tropis, cocok untuk pecinta petualangan.',
      },
      {
        'image': 'assets/alunalun.jpg',
        'title': 'Alun-Alun Purwokerto',
        'desc':
            'Pusat keramaian kota dengan suasana malam yang hidup, penuh kuliner dan hiburan rakyat.',
      },
      {
        'image': 'assets/museum.jpg',
        'title': 'Museum Jenderal Soedirman',
        'desc':
            'Museum bersejarah untuk mengenang perjuangan sang Panglima Besar dari Banyumas.',
      },
      {
        'image': 'assets/telaga.jpg',
        'title': 'Telaga Sunyi',
        'desc':
            'Surga tersembunyi di lereng Gunung Slamet dengan air sebening kaca dan ketenangan alami.',
      },
      {
        'image': 'assets/caub.jpg',
        'title': 'Caub',
        'desc':
            'Spot nyantai dan citylight terbaik di Baturaden, sangat cocok bagi pecinta pemandangan.',
      },
    ];

    final List<String> randomPhotos = [
      'assets/cipendok.jpg',
      'assets/masjid.jpg',
      'assets/museum.jpg',
      'assets/underpas.jpg',
      'assets/hutanpinus.jpg',
      'assets/alunalunpwt.jpg',
      'assets/menara.jpg',
      'assets/curugjenggala.jpg',
      'assets/kotalama.jpg',
      'assets/jalan.jpg',
      'assets/telaga.jpg',
      'assets/teratai.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          // ===================== SLIVER APP BAR =====================
          SliverAppBar(
            expandedHeight: 350,
            floating: false,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'VISIT BANYUMAS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/menara.jpg', fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(0.4)),
                ],
              ),
            ),
          ),

          // ===================== SLIVER LIST =====================
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),

              // ==== SECTION: Intro ====
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "✨ Destination Recommendations ✨",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Temukan destinasi wisata terbaik di Purwokerto dan sekitarnya yang akan membuat liburanmu tak terlupakan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ==== SECTION: LIST DESTINASI ====
              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: wisataList.length,
                  itemBuilder: (context, index) {
                    final wisata = wisataList[index];
                    return DestinationCard(
                      image: wisata['image']!,
                      title: wisata['title']!,
                      subtitle: wisata['desc']!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),

              // ==== SECTION: EXPLORE ====
              // ==== SECTION: EXPLORE ====
              Stack(
                alignment: Alignment.bottomLeft, // posisi utama ke kiri bawah
                children: [
                  Image.asset(
                    'assets/telaga.jpg',
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 320,
                    color: Colors.black.withOpacity(0.65),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 25,
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.end, // dorong ke bawah
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // teks ke kiri
                      children: const [
                        Text(
                          "TRAVEL AND ENJOY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          "YOUR HOLIDAY IN PURWOKERTO",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Nikmati pesona alam dan budaya Banyumas. Dari Telaga Sunyi yang menenangkan, hingga Baturaden yang menakjubkan, setiap tempat menyimpan cerita dan keindahan tersendiri.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // ==== SECTION: WHY VISIT ====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Why Visit Banyumas?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Karena Banyumas bukan hanya sekadar tempat — ini adalah pengalaman. Suasana alam yang menenangkan, keramahan warga lokal, dan keindahan alami yang masih terjaga.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ==== RANDOM PHOTO GRID ====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Wrap(
                  alignment: WrapAlignment
                      .center, // <-- Tambahkan ini agar posisi foto center
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(randomPhotos.length, (index) {
                    final double randomSize = (index % 3 == 0)
                        ? 130
                        : (index % 4 == 0 ? 100 : 160);

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        randomPhotos[index],
                        width: randomSize,
                        height: randomSize,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),

              // ==== FOOTER ====
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "© 2025 Visit Banyumas | Designed by Gilang",
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

// ===================== DESTINATION CARD =====================
class DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const DestinationCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.85), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
