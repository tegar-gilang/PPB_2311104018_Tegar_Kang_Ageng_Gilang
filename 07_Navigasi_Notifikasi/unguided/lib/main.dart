import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopNow E-Commerce",
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffe81e63)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
