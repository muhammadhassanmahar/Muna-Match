import 'package:flutter/material.dart';

class CompleteProfileTaglineScreen extends StatefulWidget {
  const CompleteProfileTaglineScreen({super.key});

  @override
  State<CompleteProfileTaglineScreen> createState() => _CompleteProfileTaglineScreenState();
}

class _CompleteProfileTaglineScreenState extends State<CompleteProfileTaglineScreen> {
  final TextEditingController _taglineController = TextEditingController();
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _taglineController.addListener(() {
      setState(() {
        _isButtonActive = _taglineController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _taglineController.dispose();
    super.dispose();
  }

  void _onContinue() {
    // 👇 Replace with your next screen route
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NextScreenPlaceholder()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Complete Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Write a tagline about yourself",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _taglineController,
              maxLength: 50,
              decoration: InputDecoration(
                hintText: "e.g. Dreamer | Traveller | Foodie",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isButtonActive ? _onContinue : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Continue", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextScreenPlaceholder extends StatelessWidget {
  const NextScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Next Screen Here")),
    );
  }
}
