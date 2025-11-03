import 'package:flutter/material.dart';

void main() {
  runApp(const LatihanMemilihGambar());
}

class LatihanMemilihGambar extends StatelessWidget {
  const LatihanMemilihGambar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Memilih Gambar',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF115967),
          title: const Text(
            'Latihan Memilih Gambar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFF9FAFB),
        body: const GambarContainer(),
      ),
    );
  }
}

class GambarContainer extends StatelessWidget {
  const GambarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF115967);
    const accentColor = Color(0xFFE63946);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container untuk gambar
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.image_outlined,
                  color: Colors.grey,
                  size: 100,
                ),
              ),
            ),

            const SizedBox(height: 80),

            // Tombol Camera & Gallery
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 160,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                    label: const Text(
                      'Camera',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 4,
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text(
                      'Gallery',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 4,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tombol hapus gambar
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'Hapus Gambar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
