import 'package:flutter/material.dart';

class BeginJourneyScreen extends StatelessWidget {
  const BeginJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDFBF8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to AboutYouScreen
          },
        ),
        title: const Text("Begin Journey"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "This is the Begin Journey Screen",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
