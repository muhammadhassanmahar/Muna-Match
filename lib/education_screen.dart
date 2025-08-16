import 'package:flutter/material.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  String? selectedEducation;

  final List<String> educationLevels = [
    "Secondary School",
    "Non-degree Qualification",
    "Bachelors Degree",
    "Masters degree",
    "Doctorate",
    "Other Education Level"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0), // light beige
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFAF6F0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What’s your Education Level?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Options list (fixed: no .toList())
            ...educationLevels.map((level) {
              final isSelected = selectedEducation == level;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedEducation = level;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    level,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.black : Colors.grey[800],
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),

            // Continue button (fixed: withValues instead of withOpacity)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedEducation == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Placeholder(),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEB9A3), // active color
                  disabledBackgroundColor:
                      const Color(0xFFFEB9A3).withValues(alpha: 0.5), // fixed
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
