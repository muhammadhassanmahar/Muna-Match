import 'package:flutter/material.dart';

class BornMuslimScreen extends StatelessWidget {
  const BornMuslimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Born Muslim Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
