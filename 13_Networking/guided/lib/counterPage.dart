import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Counter Page")),
      
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Text(
                counterController.count.toString(),
                style: const TextStyle(fontSize: 32),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: counterController.increment,
              child: const Text("Tambah"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Get.toNamed("/ruangUji"),
              child: const Text("Ke Ruang Uji"),
            ),
          ],
        ),
      ),
    );
  }
}