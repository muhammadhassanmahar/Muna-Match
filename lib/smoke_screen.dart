import 'package:flutter/material.dart';

class SmokeScreen extends StatefulWidget {
  const SmokeScreen({super.key});

  @override
  State<SmokeScreen> createState() => _SmokeScreenState();
}

class _SmokeScreenState extends State<SmokeScreen> {
  String? selectedOption = "Yes"; // default selected

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFAF5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: LinearProgressIndicator(
          value: 0.3, // progress value adjust as per flow
          backgroundColor: Colors.grey.shade300,
          color: Colors.red,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {
              // Help button action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Do you smoke?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),

            // Yes Option
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = "Yes";
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: selectedOption == "Yes"
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ),
                  if (selectedOption == "Yes")
                    const Icon(Icons.check_circle, color: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // No Option
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = "No";
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "No",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: selectedOption == "No"
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ),
                  if (selectedOption == "No")
                    const Icon(Icons.check_circle, color: Colors.red),
                ],
              ),
            ),

            const Spacer(),

            // Continue Button
            SizedBox(
              width: size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Navigate to next screen
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
