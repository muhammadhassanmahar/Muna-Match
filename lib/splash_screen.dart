import 'package:flutter/material.dart';
import 'sign_up_screen.dart'; // Make sure the path is correct

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; // ✅ Fix for use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF6F61), // Coral background
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // Your logo path
          width: 120,
          height: 120,
          color: const Color(0xFFF5F5EC), // Off-white logo
        ),
      ),
    );
  }
}
