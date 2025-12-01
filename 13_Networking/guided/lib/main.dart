import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ruangUji.dart';
import 'counterPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());

    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: () => const CounterPage()),
        GetPage(name: "/ruangUji", page: () => const RuangUji()),
      ],
    );
  }
}

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() => count++;
}