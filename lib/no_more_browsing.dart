import 'package:flutter/material.dart';

class NoMoreBrowsingScreen extends StatelessWidget {
  const NoMoreBrowsingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "No More Browsing",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          "This is the No More Browsing Screen",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
