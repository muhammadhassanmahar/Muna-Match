import 'package:flutter/material.dart';
import 'gender_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF8),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),

            // Logo
            Image.asset(
              'assets/images/logo2.png',
              height: 40,
            ),

            // Illustration (thoda upar shift)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/characters.png',
                height: 180, // thoda chhota kiya taake upar lag sake
              ),
            ),

            // Text content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  Text(
                    "Salaam and welcome to Muna",
                    style: TextStyle(
                      fontSize: 24, // bara kiya
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Looks like you’re new here, \nyouremail@gmail.com",
                    style: TextStyle(
                      fontSize: 16, // bara kiya
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Tell us about yourself and InshaAllah we will show you great Muslims nearby.",
                    style: TextStyle(
                      fontSize: 16, // bara kiya
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Get Started button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 55, // thoda bada button
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenderScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6F61),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
