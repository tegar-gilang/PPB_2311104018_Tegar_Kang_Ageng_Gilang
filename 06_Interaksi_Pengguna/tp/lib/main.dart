import 'package:flutter/material.dart';

void main() {
  runApp(const NavBarApp());
}

class NavBarApp extends StatelessWidget {
  const NavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveArea & PageView',
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
    Center(
      child: Text(
        'Halaman Home',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
    Center(
      child: Text(
        'Halaman Aduan',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
    Center(
      child: Text(
        'Halaman Search',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
    Center(
      child: Text(
        'Halaman Notifikasi',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
    Center(
      child: Text(
        'Halaman Profil',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          _pages[_selectedIndex],
        ],
      ),

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
