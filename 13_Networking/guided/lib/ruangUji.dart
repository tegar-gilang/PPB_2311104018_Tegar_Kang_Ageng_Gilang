import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RuangUji extends StatelessWidget {
  const RuangUji({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ruang Uji")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ruang Uji'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Get.back(); 
              },
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}