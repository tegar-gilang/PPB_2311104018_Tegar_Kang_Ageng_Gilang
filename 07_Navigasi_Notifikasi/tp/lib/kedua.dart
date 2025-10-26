import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi Multi Halaman',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    AduanPage(),
    NotifPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: 'Aduan'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notif'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF113A46),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
        ),
        padding: const EdgeInsets.all(12),
        child: const Icon(Icons.search, color: Colors.white, size: 30),
      ),
    );
  }
}

// ==== TEMPLATE HALAMAN ====
class PageTemplate extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final BuildContext context;

  const PageTemplate({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.context,
  });

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF113A46),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF5F7F9),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(icon, size: 70, color: const Color(0xFF113A46)),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF113A46),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildNavButton(ctx, "Home", Icons.home, const HomePage()),
                  _buildNavButton(ctx, "Aduan", Icons.edit_note, const AduanPage()),
                  _buildNavButton(ctx, "Notif", Icons.notifications, const NotifPage()),
                  _buildNavButton(ctx, "Profil", Icons.person, const ProfilePage()),
                ],
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext ctx, String text, IconData icon, Widget page) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushReplacement(
          ctx,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF113A46),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

// ==== HALAMAN SPESIFIK ====
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      icon: Icons.home,
      title: "Halaman Home",
      description: "Selamat datang di aplikasi! Jelajahi fitur utama untuk pengalaman terbaik.",
      context: context,
    );
  }
}

class AduanPage extends StatelessWidget {
  const AduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      icon: Icons.edit_note,
      title: "Halaman Aduan",
      description: "Laporkan masalah Anda dengan mudah dan cepat melalui halaman ini.",
      context: context,
    );
  }
}

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      icon: Icons.notifications,
      title: "Halaman Notifikasi",
      description: "Lihat pemberitahuan terbaru dari sistem dan tindak lanjut aduan Anda.",
      context: context,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      icon: Icons.person,
      title: "Halaman Profil",
      description: "Kelola data diri dan informasi akun Anda di halaman ini.",
      context: context,
    );
  }
}
