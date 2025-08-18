import 'package:flutter/material.dart';
import 'nationality_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String phoneNumber;

  const VerifyCodeScreen({super.key, required this.phoneNumber});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _codeController.addListener(() {
      setState(() {
        isButtonActive = _codeController.text.length == 6;
      });
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button Row
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Icon(Icons.help_outline, color: Colors.black54),
                ],
              ),
              const SizedBox(height: 10),

              // Title
              const Text(
                "Enter verification code",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                "Please enter the 6-digit code sent to\n${widget.phoneNumber} via SMS",
                style: const TextStyle(color: Colors.black54, fontSize: 15),
              ),
              const SizedBox(height: 30),

              // OTP TextField
              TextField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24, letterSpacing: 20, color: Colors.black),
                decoration: const InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              const Text(
                "You can request a new code in 30 seconds",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isButtonActive ? const Color(0xFFFF6B5C) : Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: isButtonActive
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NationalityScreen(),
                            ),
                          );
                        }
                      : null,
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
