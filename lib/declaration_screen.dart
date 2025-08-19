import 'package:flutter/material.dart';
import 'notification_1_screen.dart';

class DeclarationScreen extends StatelessWidget {
  const DeclarationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F1), // हल्का क्रीम बैकग्राउंड
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bismillah Image (आप अपने assets से replace करें)
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/bismillah.png", // आपकी asset image
                      height: 60,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "IN THE NAME OF GOD,\nTHE MOST GRACIOUS, THE MOST MERCIFUL",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "I promise to:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Bullet Points
              const Text("• Respect Islamic etiquettes"),
              SizedBox(height: 6),
              const Text(
                  "• Not to be married. MunaMatch is for single Muslims only."),
              SizedBox(height: 6),
              const Text(
                  "• Adhere to the MunaMatch Behavior guidelines"),

              const SizedBox(height: 15),
              const Text(
                "I agree that any inappropriate behavior will lead to my account being permanently blocked",
                style: TextStyle(color: Colors.black87),
              ),

              const SizedBox(height: 30),

              // Auto generated signature box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Auto Generated name signature here",
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              const Spacer(),

              // I accept button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Notification1Screen(),
                      ),
                    );
                  },
                  child: const Text(
                    "I accept",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Terms & Privacy
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    children: [
                      const TextSpan(text: "By continuing you agree to our "),
                      TextSpan(
                        text: "Terms and Privacy Policies",
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
