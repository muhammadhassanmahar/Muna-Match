import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Gender"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What's your gender?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            RadioListTile<String>(
              title: const Text("Male"),
              value: "Male",
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Female"),
              value: "Female",
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedGender != null) {
                    // Next screen navigation
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Selected: $selectedGender")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
