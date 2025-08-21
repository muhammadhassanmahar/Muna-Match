import 'package:flutter/material.dart';
import 'complete_profile_interest_screen.dart';

class CompleteProfileProfessionScreen extends StatefulWidget {
  const CompleteProfileProfessionScreen({super.key});

  @override
  State<CompleteProfileProfessionScreen> createState() =>
      _CompleteProfileProfessionScreenState();
}

class _CompleteProfileProfessionScreenState
    extends State<CompleteProfileProfessionScreen> {
  String selectedProfession = "No Preference";

  final List<String> professions = [
    "No Preference",
    "Accountant",
    "Acting professional",
    "Actor",
    "Administration employee",
    "Administration Professional",
    "Advertising Professional",
    "Advisor",
    "Airline Pilot",
    "Animator",
  ];

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
          "Profession",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedProfession = "No Preference";
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
        children: [
          // 🔍 Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Countries",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
            ),
          ),

          // Profession List
          Expanded(
            child: ListView.builder(
              itemCount: professions.length,
              itemBuilder: (context, index) {
                final profession = professions[index];
                return ListTile(
                  title: Text(
                    profession,
                    style: TextStyle(
                      color: profession == "Animator"
                          ? Colors.grey // animator greyed out
                          : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  trailing: selectedProfession == profession
                      ? const Icon(Icons.check, color: Colors.redAccent)
                      : null,
                  onTap: profession == "Animator"
                      ? null
                      : () {
                          setState(() {
                            selectedProfession = profession;
                          });
                        },
                );
              },
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
                      builder: (_) => const CompleteProfileInterestScreen(),
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
