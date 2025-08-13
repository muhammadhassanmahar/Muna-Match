import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'sign_up_screen.dart';
import 'email_screen.dart';  // Added for routing
import 'verification_screen.dart'; 
import 'welcome_screen.dart'; 

void main() {
  runApp(const MunaMatchApp());
}

class MunaMatchApp extends StatelessWidget {
  const MunaMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muna Match',

      // Theme setup
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6F61), // Coral
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto', // Change to your desired font
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),

      // Initial screen
      home: const SplashScreen(),

      // Named routes
      routes: {
        '/email_screen': (context) => const EmailScreen(),
         '/verification': (context) => const VerificationScreen(),
          '/welcome': (context) => const WelcomeScreen(),
           '/sign-up': (context) => const SignUpScreen(),
      },
    );
  }
}
