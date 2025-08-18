import 'package:flutter/material.dart';

class MaritalStatusScreen extends StatefulWidget {
  const MaritalStatusScreen({super.key});

  @override
  State<MaritalStatusScreen> createState() => _MaritalStatusScreenState();
}

class _MaritalStatusScreenState extends State<MaritalStatusScreen> {
  int? selectedIndex;

  final List<String> statuses = [
    'Never Married',
    'Seprated',
    'Divorce',
    'Annulled',
    'widowed',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF6EF),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.help_outline, color: Colors.black),
          )
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: LinearProgressIndicator(
            value: 0.3,
            backgroundColor: Color(0xFFE0E0E0),
            valueColor: AlwaysStoppedAnimation(Color(0xFF000000)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What’s your marital status?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(statuses.length, (index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    statuses[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.redAccent : Colors.black,
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedIndex != null ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedIndex != null
                      ? Colors.redAccent
                      : Colors.redAccent.withAlpha(102), // 102 is ~40% opacity
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
