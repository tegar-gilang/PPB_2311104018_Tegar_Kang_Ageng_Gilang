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
  int _selectedIndex = 2;
  bool _isHoveringSearch = false;

  final List<Widget> _pages = const [
    Center(child: Text('Halaman Home', style: TextStyle(fontSize: 18))),
    Center(child: Text('Halaman Aduan', style: TextStyle(fontSize: 18))),
    UMKMDesaPage(),
    Center(child: Text('Halaman Notifikasi', style: TextStyle(fontSize: 18))),
    Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 18))),
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
                _navIcon(Icons.edit_note_rounded, 1, "Aduan"),
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
                      border: Border.all(color: Colors.white, width: 7),
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
// ===================== PAGE UMKM =====================
class UMKMDesaPage extends StatelessWidget {
  const UMKMDesaPage({super.key});

  final List<Map<String, dynamic>> _umkmList = const [
    {
      'name': 'Oraumum',
      'address': 'Jl. Dr. Soeparno No. 98 Kembaran Wetan',
      'rating': 4.7,
      'image': 'assets/satu.jpg',
    },
    {
      'name': 'Mampir Pawon',
      'address': 'Jl. Mawar No. 5 Kembaran Wetan',
      'rating': 4.8,
      'image': 'assets/dua.jpg',
    },
    {
      'name': 'Warung Mie Ramen',
      'address': 'Jl. Mojo Gede Kembaran Wetan',
      'rating': 4.5,
      'image': 'assets/tiga.jpg',
    },
    {
      'name': 'Roti Sehati',
      'address': 'Jl. Gayamsari Kembaran Wetan',
      'rating': 4.7,
      'image': 'assets/empat.jpg',
    },
    {
      'name': 'Ayam Geprek Juara',
      'address': 'Jl. Anggrek No. 12 Kembaran Wetan',
      'rating': 4.9,
      'image': 'assets/sepuluh.jpg',
    },
    {
      'name': 'Bakso Pak Diran',
      'address': 'Jl. Jendral Sudirman No. 21 Kembaran Wetan',
      'rating': 4.6,
      'image': 'assets/lima.jpg',
    },
    {
      'name': 'Kopi Kenangan',
      'address': 'Jl. Melati No. 8 Kembaran Wetan',
      'rating': 4.8,
      'image': 'assets/delapan.jpg',
    },
    {
      'name': 'Warunk Upnormal',
      'address': 'Jl. Pahlawan No. 17 Kembaran Wetan',
      'rating': 4.5,
      'image': 'assets/sembilan.jpg',
    },
    {
      'name': 'Sate Mbok Jowo',
      'address': 'Jl. Wijaya Kusuma No. 10 Kembaran Wetan',
      'rating': 4.9,
      'image': 'assets/enam.jpg',
    },
    {
      'name': 'Es Teh Manis',
      'address': 'Jl. Raya Timur No. 3 Kembaran Wetan',
      'rating': 4.6,
      'image': 'assets/tujuh.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Row(
              children: [
                const Icon(Icons.arrow_back_rounded, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        prefixIcon:
                            Icon(Icons.search, color: Colors.grey, size: 26),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Kategori
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryChip(label: 'Perabotan Rumah'),
                  CategoryChip(label: 'Makanan'),
                  CategoryChip(label: 'Minuman'),
                  CategoryChip(label: 'Keperluan'),
                  CategoryChip(label: 'Peralatan Rumah'),
                  CategoryChip(label: 'Lainnya'),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // List toko bisa di-scroll
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['address'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 20),
                                      const SizedBox(width: 6),
                                      Text(
                                        item['rating'].toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15,
                                        ),
                                      ),
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
                                            color: Colors.white, size: 23),
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
// ===================== DETAIL PAGE =====================
class DetailUMKMPage extends StatelessWidget {
  final Map<String, dynamic> umkm;
  const DetailUMKMPage({super.key, required this.umkm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(umkm['name']),
        backgroundColor: const Color(0xFFD62828),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                  fontSize: 22, fontWeight: FontWeight.bold),
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
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              umkm['address'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black54),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}
