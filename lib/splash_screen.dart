import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF6F61), // Coral background
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // Apna logo ka path
          width: 120,
          height: 120,
          color: const Color(0xFFF5F5EC), // Off-white logo
        ),
      ),
    );
  }
}
