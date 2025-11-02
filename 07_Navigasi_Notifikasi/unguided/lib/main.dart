import 'package:flutter/material.dart';

void main() {
  runApp(const NavBarApp());
}

class NavBarApp extends StatelessWidget {
  const NavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMKM Desa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
      home: const BottomNavExample(),
    );
  }
}

class BottomNavExample extends StatefulWidget {
  const BottomNavExample({super.key});

  @override
  State<BottomNavExample> createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;
  bool _isHoveringSearch = false;

  final List<Widget> _pages = const [
    HomePage(),
    UMKMDesaPage(),
    SearchPage(), //  Sekarang SearchPage aktif di tombol tengah
    NotifikasiPage(),
    ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(child: _pages[_selectedIndex]),

      // ===== NAVBAR =====
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navIcon(Icons.home_rounded, 0, "Home"),
                _navIcon(Icons.bar_chart_rounded, 1, "Chart"),
                const SizedBox(width: 70),
                _navIcon(Icons.notifications_none_rounded, 3, "Notifikasi"),
                _navIcon(Icons.person_outline_rounded, 4, "Profil"),
              ],
            ),

            // Tombol Tengah (Search)
            Positioned(
              top: 8,
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHoveringSearch = true),
                onExit: (_) => setState(() => _isHoveringSearch = false),
                child: GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 2
                          ? const Color(0xFF023B3D)
                          : (_isHoveringSearch
                              ? const Color(0xFF02555A)
                              : const Color(0xFF12676D)),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 6.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 9,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 38,
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

  Widget _navIcon(IconData icon, int index, String label) {
    bool selected = _selectedIndex == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () => _onItemTapped(index),
          icon: Icon(
            icon,
            color: selected ? Colors.white : Colors.white70,
            size: selected ? 35 : 32,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : Colors.white70,
          ),
        ),
      ],
    );
  }
}

//
// ===================== HALAMAN HOME =====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Beranda', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 2, 92, 86),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Selamat datang di UMKM Desa!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

//
// ===================== HALAMAN SEARCH =====================
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title:
            const Text('Pencarian', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 2, 92, 86),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari produk atau toko...',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 26),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Masukkan kata kunci pencarian untuk menemukan produk atau UMKM yang Anda inginkan.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

//
// ===================== PAGE CHART / UMKM =====================
class UMKMDesaPage extends StatelessWidget {
  const UMKMDesaPage({super.key});

  final List<Map<String, dynamic>> _umkmList = const [
    {'name': 'Oraumum', 'address': 'Jl. Dr. Soeparno No. 98 Purwokerto', 'rating': 4.7, 'image': 'assets/satu.jpg'},
    {'name': 'Mampir Pawon', 'address': 'Jl. Mawar No. 5 Purwokerto', 'rating': 4.8, 'image': 'assets/dua.jpg'},
    {'name': 'Warung Mie Ramen', 'address': 'Jl. Mojo Gede Purwokerto', 'rating': 4.5, 'image': 'assets/tiga.jpg'},
    {'name': 'Roti Sehati', 'address': 'Jl. Gayamsari Purwokerto', 'rating': 4.7, 'image': 'assets/empat.jpg'},
    {'name': 'Dapur Sari', 'address': 'Jl. Jati No. 21 Purwokerto', 'rating': 4.9, 'image': 'assets/lima.jpg'},
    {'name': 'Sambel Ijo Maknyus', 'address': 'Jl. Melati No. 11 Purwokerto', 'rating': 4.6, 'image': 'assets/enam.jpg'},
    {'name': 'Wedangan Pak Man', 'address': 'Jl. Anggrek 3 Purwokerto', 'rating': 4.8, 'image': 'assets/tujuh.jpg'},
    {'name': 'Bakpia Roso', 'address': 'Jl. Kartini No. 4 Purwokerto', 'rating': 4.7, 'image': 'assets/delapan.jpg'},
    {'name': 'Nasi Goreng Lezat', 'address': 'Jl. Kenanga No. 2 Purwokerto', 'rating': 4.9, 'image': 'assets/sembilan.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Chart Toko', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 2, 92, 86),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Pencarian Produk',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 26),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Kategori
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryChip(label: 'Perabotan'),
                  CategoryChip(label: 'Makanan'),
                  CategoryChip(label: 'Minuman'),
                  CategoryChip(label: 'Peralatan Rumah'),
                  CategoryChip(label: 'Kebutuhan Harian'),
                  CategoryChip(label: 'Lainnya'),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // List toko
            Expanded(
              child: ListView.builder(
                itemCount: _umkmList.length,
                itemBuilder: (context, index) {
                  final item = _umkmList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailUMKMPage(umkm: item),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                            ),
                            child: Image.asset(
                              item['image'],
                              height: 110,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 4),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(item['name'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800)),
                                  const SizedBox(height: 4),
                                  Text(item['address'],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54)),
                                  const SizedBox(height: 7),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 20),
                                      const SizedBox(width: 6),
                                      Text(item['rating'].toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15)),
                                      const Spacer(),
                                      Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(Icons.add,
                                            color: Colors.white, size: 22),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// ===================== HALAMAN NOTIFIKASI =====================
class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Notifikasi', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 2, 92, 86),
        centerTitle: true,
      ),
      body: const Center(
        child:
            Text('Belum ada notifikasi baru.', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

//
// ===================== HALAMAN PROFIL =====================
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Profil Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 2, 92, 86),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Informasi Profil Pengguna',
            style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

//
// ===================== DETAIL PAGE =====================
class DetailUMKMPage extends StatelessWidget {
  final Map<String, dynamic> umkm;
  const DetailUMKMPage({super.key, required this.umkm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ Background putih
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // ✅ Warna arrow back diubah jadi putih
        ),
        title: Text(
          umkm['name'],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 92, 86),
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                umkm['image'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              umkm['name'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 22),
                const SizedBox(width: 5),
                Text(
                  umkm['rating'].toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              umkm['address'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//
// ===================== CHIP KATEGORI =====================
class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Text(label,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
    );
  }
}
