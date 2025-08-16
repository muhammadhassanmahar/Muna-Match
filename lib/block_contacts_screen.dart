import 'package:flutter/material.dart';
import 'enable_notifications_screen.dart';

class BlockContactsScreen extends StatelessWidget {
  const BlockContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0), // light beige
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFAF6F0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.04),

            // Image Placeholder
            Container(
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage("assets/images/spy.png"), // apna asset lagao
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.04),

            // Title text
            const Text(
              "Don’t want family and friends to see you on Muzz?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: size.height * 0.015),

            // Subtitle text
            const Text(
              "Hide your Profile from people in your contact list...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const Spacer(),

            // Block Contacts Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // yahan baad mai action dalna
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6C5C), // red
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Block Contacts",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.015),

            // Skip for now Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EnableNotificationsScreen(),
                  ),
                );
              },
              child: const Text(
                "Skip for now",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
