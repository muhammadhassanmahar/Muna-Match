import 'package:flutter/material.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

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
              onPressed: () {
                // TODO: Add verification logic
                final otp = otpController.text;
                if (otp.length == 6) {
                  // Navigate or verify
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('OTP Entered: $otp')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter 6-digit OTP')),
                  );
                }
              },
              child: const Text('Verify'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Resend OTP logic
              },
              child: const Text("Didn't receive OTP? Resend"),
            )
          ],
        ),
      ),
    );
  }
}
