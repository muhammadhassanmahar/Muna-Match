import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedLanguage = "English";

  final List<String> languages = [
    "English",
    "Urdu",
    "Arabic",
    "French",
    "German",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            "assets/images/background.png", // Background image
            fit: BoxFit.cover,
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Top bar with language & help icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Language dropdown
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedLanguage,
                          icon: const Icon(Icons.language, color: Colors.white),
                          dropdownColor: Colors.black87,
                          style: const TextStyle(color: Colors.white),
                          items: languages.map((lang) {
                            return DropdownMenuItem(
                              value: lang,
                              child: Text(lang),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          },
                        ),
                      ),

                      // Help icon
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.help_outline, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Logo
                Image.asset(
                  "assets/images/logo.png", // Your logo image
                  height: 80,
                ),
                const SizedBox(height: 10),

                // App name
                const Text(
                  "Muna Match",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                // Continue with Apple button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: Image.asset(
                      "assets/images/apple.png", // Apple logo
                      height: 24,
                    ),
                    label: const Text(
                      "Continue with Apple",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      // Apple Sign In will be added later
                    },
                  ),
                ),
                const SizedBox(height: 12),

                // Continue with Google button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: Image.asset(
                      "assets/images/google.png", // Google logo
                      height: 24,
                    ),
                    label: const Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      // Google Sign In will be added later
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Continue with Email text
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/email_screen');
                  },
                  child: const Text(
                    "Continue with email",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Terms and Privacy
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text.rich(
                    TextSpan(
                      text: "By continuing you agree to our ",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      children: [
                        TextSpan(
                          text: "Terms",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                        ),
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
