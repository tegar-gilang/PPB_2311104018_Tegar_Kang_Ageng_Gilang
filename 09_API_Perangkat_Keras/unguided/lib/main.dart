import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
            '',
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

class GambarContainer extends StatefulWidget {
  const GambarContainer({super.key});

  @override
  State<GambarContainer> createState() => _GambarContainerState();
}

class _GambarContainerState extends State<GambarContainer> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  static const primaryColor = Color(0xFF115967);
  static const accentColor = Color(0xFFE63946);

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _hapusGambar() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container gambar
            Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                border: Border.all(color: Colors.grey.shade400, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _image == null
                  ? const Center(
                      child: Icon(
                        Icons.image_outlined,
                        color: Colors.grey,
                        size: 100,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
            ),

            const SizedBox(height: 80),

            // Tombol Camera & Gallery
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Tombol Camera
                SizedBox(
                  width: 160,
                  height: 45,
                  child: ElevatedButton.icon(
                    key: const Key("btnCamera"),
                    onPressed: _getImageFromCamera,
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

                // Tombol Gallery
                SizedBox(
                  width: 160,
                  height: 45,
                  child: ElevatedButton.icon(
                    key: const Key("btnGallery"),
                    onPressed: _getImageFromGallery,
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

            const SizedBox(height: 30),

            // Tombol hapus gambar
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                key: const Key("btnHapus"),
                onPressed: _hapusGambar,
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
