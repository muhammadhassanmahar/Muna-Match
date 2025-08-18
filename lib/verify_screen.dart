import 'package:flutter/material.dart';
import 'verify_code_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool isButtonEnabled = false;

  void _onPhoneChanged() {
    setState(() {
      isButtonEnabled = _phoneController.text.length >= 10; // adjust as needed
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffef5ec),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Verify your phone number',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your phone number will never be shared on your profile, it’s only used to send a verification code.",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled
                        ? const Color(0xfffeba9d)
                        : const Color(0xfffeba9d).withAlpha((0.5 * 255).toInt()),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyCodeScreen(
                                phoneNumber: _phoneController.text,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
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
