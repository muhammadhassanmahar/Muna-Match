import 'package:flutter/material.dart';
import 'verify_screen.dart'; // Import the VerifyScreen

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Navigation
              Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.black12,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.help_outline),
                ],
              ),
              const SizedBox(height: 20),

              // Heading
              const Text(
                "Add more photos for\nyou profile",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Photo Grid (3x2)
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(
                  6,
                  (index) => Container(
                    width: (width - 64) / 3,
                    height: (width - 64) / 3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 1,
                        style: BorderStyle.solid, // Correct place
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                    ),
                    child: const Center(
                      child: Icon(Icons.add, size: 30, color: Colors.black38),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Photo Guidelines",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Photo Visibility
              GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Photo Visibility",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Your photos are visible to all verified members.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
              ),

              const Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B5C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
