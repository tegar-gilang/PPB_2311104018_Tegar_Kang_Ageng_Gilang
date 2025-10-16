import 'package:flutter/material.dart';

void main() {
  runApp(const WisataBanyumasApp());
}

class WisataBanyumasApp extends StatelessWidget {
  const WisataBanyumasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visit Banyumas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const BottomNavExample(),
    );
  }
}

// =====================================================
// NAVBAR CUSTOM
// =====================================================

class BottomNavExample extends StatefulWidget {
  const BottomNavExample({super.key});

  @override
  State<BottomNavExample> createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;
  bool _isHoveringSearch = false;

  final List<Widget> _pages = const [
    VisitBanyumasHome(),
    ExplorePage(),
    SearchPage(),
    NotifikasiPage(),
    ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 85,
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFD62828),
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ===== Bar ikon =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navIcon(Icons.home_rounded, 0),
                _navIcon(Icons.explore_rounded, 1),
                const SizedBox(width: 70),
                _navIcon(Icons.notifications_none_rounded, 3),
                _navIcon(Icons.person_outline_rounded, 4),
              ],
            ),

            // ===== Tombol tengah (search) =====
            Positioned(
              top: 10,
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHoveringSearch = true),
                onExit: (_) => setState(() => _isHoveringSearch = false),
                child: GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 2
                          ? const Color(0xFF023B3D)
                          : (_isHoveringSearch
                              ? const Color(0xFF023B3D)
                              : const Color(0xFF12676D)),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    bool selected = _selectedIndex == index;
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => _onItemTapped(index),
      icon: Icon(
        icon,
        color: selected ? Colors.white : Colors.white70,
        size: 33,
      ),
    );
  }
}

// =====================================================
// HALAMAN 1 — VISIT BANYUMAS (Referensi dari kode kamu)
// =====================================================

class VisitBanyumasHome extends StatelessWidget {
  const VisitBanyumasHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> wisataList = [
      {
        'image': 'assets/baturaden.jpeg',
        'title': 'Baturaden',
        'desc':
            'Destinasi populer di kaki Gunung Slamet dengan udara sejuk dan panorama menenangkan.'
      },
      {
        'image': 'assets/cipendok.jpg',
        'title': 'Curug Cipendok',
        'desc':
            'Air terjun megah setinggi 92 meter yang tersembunyi di tengah hutan tropis.'
      },
      {
        'image': 'assets/alunalun.jpg',
        'title': 'Alun-Alun Purwokerto',
        'desc':
            'Pusat keramaian kota dengan suasana malam yang hidup dan penuh kuliner.'
      },
      {
        'image': 'assets/museum.jpg',
        'title': 'Museum Soedirman',
        'desc':
            'Museum bersejarah mengenang perjuangan Panglima Besar Jenderal Soedirman.'
      },
      {
        'image': 'assets/telaga.jpg',
        'title': 'Telaga Sunyi',
        'desc':
            'Surga tersembunyi di lereng Gunung Slamet dengan air sebening kaca.'
      },
      {
        'image': 'assets/caub.jpg',
        'title': 'Bukit Tranggulasih',
        'desc':
            'Spot sunrise dan citylight terbaik di Banyumas, cocok untuk fotografi.'
      },
    ];

    final List<String> randomPhotos = [
      'assets/baturaden.jpeg',
      'assets/cipendok.jpg',
      'assets/alunalun.jpg',
      'assets/museum.jpg',
      'assets/caub.jpg',
      'assets/telaga.jpg',
      'assets/curugjenggala.jpg',
      'assets/hutanpinus.jpg',
      'assets/menara.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
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
                  const Center(
                    child: Text(
                      'DISCOVER\nTHE BEAUTY OF PURWOKERTO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ========== BODY CONTENT ==========
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),

              // INTRO
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "✨ Destination Recommendations ✨",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Temukan destinasi wisata terbaik di Purwokerto dan sekitarnya yang akan membuat liburanmu tak terlupakan.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70, fontSize: 15, height: 1.5),
                ),
              ),

              const SizedBox(height: 25),

              // LIST DESTINASI
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

              // RANDOM FOTO GRID
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(randomPhotos.length, (index) {
                    final double size = (index % 3 == 0)
                        ? 130
                        : (index % 4 == 0 ? 100 : 160);
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        randomPhotos[index],
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 60),

              // FOOTER
              const Center(
                child: Text(
                  "© 2025 Visit Banyumas | Designed by Gilang",
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// KOMPONEN CARD
// =====================================================

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
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(image, fit: BoxFit.cover, width: double.infinity),
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.9), Colors.transparent],
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
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13, height: 1.3)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// HALAMAN LAIN (DUMMY)
// =====================================================

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) =>
      _dummyPage("Jelajahi Wisata", Icons.explore_rounded);
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _dummyPage("Cari Destinasi", Icons.search_rounded);
}

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _dummyPage("Notifikasi", Icons.notifications_rounded);
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});
  @override
  Widget build(BuildContext context) =>
      _dummyPage("Profil Pengguna", Icons.person_rounded);
}

Widget _dummyPage(String title, IconData icon) {
  return Scaffold(
    backgroundColor: Colors.grey.shade100,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: const Color(0xFFD62828)),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF023B3D)),
          ),
        ],
      ),
    ),
  );
}
