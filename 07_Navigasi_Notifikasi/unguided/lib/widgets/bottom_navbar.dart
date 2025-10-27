import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xffe81e63),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home_outlined, color: Colors.white, size: 28),
          Icon(Icons.search, color: Colors.white, size: 28),
          Icon(Icons.favorite_border, color: Colors.white, size: 28),
          Icon(Icons.notifications_none, color: Colors.white, size: 28),
        ],
      ),
    );
  }
}
