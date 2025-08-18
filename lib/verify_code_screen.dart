import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String phoneNumber;

  const VerifyCodeScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffef5ec),
      appBar: AppBar(
        backgroundColor: const Color(0xfffef5ec),
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Verification Code',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Code sent to: $phoneNumber',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            // You can add OTP input field and Submit button here
          ],
        ),
      ),
    );
  }
}
