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

  final List<Widget> _pages = const [
    Center(child: Text('Halaman Home')),
    Center(child: Text('Halaman Aduan')),
    UMKMDesaPage(),
    Center(child: Text('Halaman Notifikasi')),
    Center(child: Text('Halaman Profil')),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(child: _pages[_selectedIndex]),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navIcon(Icons.home_rounded, 0),
            _navIcon(Icons.edit_note_rounded, 1),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF023B3D),
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
              child: IconButton(
                icon: const Icon(Icons.search_rounded,
                    color: Colors.white, size: 35),
                onPressed: () => _onItemTapped(2),
              ),
            ),
            _navIcon(Icons.notifications_none_rounded, 3),
            _navIcon(Icons.person_outline_rounded, 4),
          ],
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    bool selected = _selectedIndex == index;
    return IconButton(
      onPressed: () => _onItemTapped(index),
      icon: Icon(icon,
          color: selected ? Colors.white : Colors.white70,
          size: selected ? 35 : 30),
    );
  }
}

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
                        prefixIcon:
                            Icon(Icons.search, color: Colors.grey, size: 26),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
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
                  CategoryChip(label: 'Perabotan'),
                  CategoryChip(label: 'Makanan'),
                  CategoryChip(label: 'Minuman'),
                  CategoryChip(label: 'Keperluan'),
                  CategoryChip(label: 'Peralatan'),
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
                  return Container(
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
                                const SizedBox(height: 7),
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
                                        borderRadius: BorderRadius.circular(10),
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

class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}
