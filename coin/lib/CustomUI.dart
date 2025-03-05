import 'package:flutter/material.dart';

class CustomUI extends StatelessWidget {
  const CustomUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIcon("assets/Profile.png", "John Doe"),
        _buildIcon("assets/Level.png", "Level 01"),
        _buildIcon("assets/Wallet.png", "\$25.00"),
      ],
    );
  }

  Widget _buildIcon(String imagePath, String text) {
    return Row(children: [
      Image.asset(
        imagePath,
        width: 50,
        height: 50,
      ),
      Text(
        text,
        style: const TextStyle(
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.w700,
          fontSize: 14, 
          height: 16 / 14, 
          letterSpacing: 0, 
        ),
      ),
    ]);
  }
}
