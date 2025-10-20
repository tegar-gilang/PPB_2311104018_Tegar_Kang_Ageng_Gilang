import 'package:flutter/material.dart';

void main() {
  runApp(const NavBarApp());
}

class NavBarApp extends StatelessWidget {
  const NavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navbar + Form',
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

  final List<Widget> _pages = const [
    Center(child: Text('Halaman Home')),
    FormAduanPage(), // Halaman Form di tombol "Tulis"
    Center(child: Text('Halaman Search')),
    Center(child: Text('Halaman Notif')),
    Center(child: Text('Halaman Profil')),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: _pages[_selectedIndex],

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
                _navIcon(Icons.home_rounded, 0),
                _navIcon(Icons.edit_note_rounded, 1),
                const SizedBox(width: 70),
                _navIcon(Icons.notifications_none_rounded, 3),
                _navIcon(Icons.person_outline_rounded, 4),
              ],
            ),
            // Tombol Tengah Search
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
                          ? const Color.fromARGB(255, 2, 59, 61)
                          : (_isHoveringSearch
                              ? const Color.fromARGB(255, 2, 59, 61)
                              : const Color.fromARGB(255, 18, 103, 109)),
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
        size: 33,
      ),
    );
  }
}

//
// ======= FORM ADUAN PAGE =======
//
class FormAduanPage extends StatefulWidget {
  const FormAduanPage({super.key});

  @override
  State<FormAduanPage> createState() => _FormAduanPageState();
}

class _FormAduanPageState extends State<FormAduanPage> {
  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _aduanController = TextEditingController();
  String? _selectedJenisAduan;
  String? _fileName;

  final List<String> jenisAduanList = [
    'Pelayanan Publik',
    'Infrastruktur',
    'Administrasi',
    'Kebersihan',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF144955),
        title: const Text(
          'Formulir Aduan',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Isi Form',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF144955),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildTextField("Nama", _namaController),
                  const SizedBox(height: 12),

                  _buildTextField("NIK", _nikController,
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 12),

                  DropdownButtonFormField<String>(
                    value: _selectedJenisAduan,
                    decoration: _inputDecoration("Jenis Aduan"),
                    items: jenisAduanList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedJenisAduan = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _fileName = "lampiran_pengaduan.png";
                      });
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Center(
                        child: Text(
                          _fileName ?? 'Unggah File',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildTextField("Sampaikan Aduan", _aduanController,
                      maxLines: 4),
                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF144955),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Aduan berhasil dikirim!'),
                          ),
                        );
                      },
                      child: const Text(
                        'Kirim Aduan',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
      );

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: _inputDecoration(label),
    );
  }
}
