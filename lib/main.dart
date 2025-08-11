import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MunaMatchApp());
}

class MunaMatchApp extends StatelessWidget {
  const MunaMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muna Match',
      home: const SplashScreen(),
    );
  }
}
