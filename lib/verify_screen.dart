import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController otpController = TextEditingController();

  void _verifyOTP() {
    final otp = otpController.text.trim();

    if (otp.length == 6) {
      // ✅ Dummy verification logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP Verified: $otp')),
      );

      // Example: Navigate to next screen
      // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
      );
    }
  }

  void _resendOTP() {
    // ✅ Dummy resend logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP has been resent')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter the verification code sent to your number',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: const Text('Verify'),
            ),
            TextButton(
              onPressed: _resendOTP,
              child: const Text("Didn't receive OTP? Resend"),
            ),
          ],
        ),
      ),
    );
  }
}
