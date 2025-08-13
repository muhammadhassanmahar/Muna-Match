import 'package:flutter/material.dart';
import 'name_screen.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5EC), // light beige bg
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF5EC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Are you a man or a woman?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _genderOption(
                  context,
                  imagePath: 'assets/images/men.png',
                  label: 'I am a man',
                ),
                _genderOption(
                  context,
                  imagePath: 'assets/images/women.png',
                  label: 'I am a woman',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderOption(BuildContext context,
      {required String imagePath, required String label}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NameScreen()),
        );
      },
      child: Column(
        children: [
          SizedBox( // Container ko SizedBox se replace kiya
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.18,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
