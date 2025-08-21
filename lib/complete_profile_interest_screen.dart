import 'package:flutter/material.dart';
import 'no_more_browsing.dart';

class CompleteProfileInterestScreen extends StatefulWidget {
  const CompleteProfileInterestScreen({super.key});

  @override
  State<CompleteProfileInterestScreen> createState() =>
      _CompleteProfileInterestScreenState();
}

class _CompleteProfileInterestScreenState
    extends State<CompleteProfileInterestScreen> {
  final List<String> interests = [
    "American football",
    "Archery",
    "Badminton",
    "Baseball",
    "Boxing",
    "Basketball",
    "Calisthenics",
    "Cricket",
    "Cycling",
    "Dancing",
    "Fencing",
    "Gym",
    "Figure Skating",
    "Golf",
  ];

  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Interests",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedInterests.clear();
              });
            },
            child: const Text(
              "Clear",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Instruction Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Select upto 15 interests so we can show you\nmore profiles that are suited to you",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              "Sport",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),

          // Interests as Chips
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: interests.map((interest) {
                  final isSelected = selectedInterests.contains(interest);
                  return ChoiceChip(
                    label: Text(interest),
                    selected: isSelected,
                    selectedColor: Colors.redAccent,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    backgroundColor: const Color(0xFFF5F5F5),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          if (selectedInterests.length < 15) {
                            selectedInterests.add(interest);
                          }
                        } else {
                          selectedInterests.remove(interest);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),

          // Confirm Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NoMoreBrowsingScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
