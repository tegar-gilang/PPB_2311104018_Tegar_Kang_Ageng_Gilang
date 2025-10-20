import 'package:flutter/material.dart';

void main() {
  runApp(const NavBarApp());
}

class NavBarApp extends StatelessWidget {
  const NavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navbar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
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

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Text(
          'Halaman ${['Home', 'Tulis', 'Search', 'Notif', 'Profil'][_selectedIndex]}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
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
                _navIcon(Icons.edit_note_rounded, 1),
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
                          ? const Color.fromARGB(255, 2, 59, 61) // hijau saat di halaman search
                          : (_isHoveringSearch
                              ? const Color.fromARGB(255, 2, 59, 61) // sedikit lebih terang saat hover
                              : const Color.fromARGB(255, 18, 103, 109)), // default
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
      padding: const EdgeInsets.all(0),
      onPressed: () => _onItemTapped(index),
      icon: Icon(
        icon,
        color: selected ? Colors.white : Colors.white70,
        size: 37,
      ),
    );
  }
}
