import 'package:flutter/material.dart';

class AboutYouScreen extends StatelessWidget {
  const AboutYouScreen({super.key}); // fixed with super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "About You",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "This is the About You Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
