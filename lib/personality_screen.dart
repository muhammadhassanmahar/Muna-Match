import 'package:flutter/material.dart';
import 'bio_screen.dart';

class PersonalityScreen extends StatefulWidget {
  const PersonalityScreen({super.key});

  @override
  PersonalityScreenState createState() => PersonalityScreenState();
}

class PersonalityScreenState extends State<PersonalityScreen> {
  final List<String> traits = [
    'Active Listener','Adventurous','Affectionate','Ambitious',
    'Animal Lover','Assertive','Bookworm','Brunch Lover',
    'Carefree','Charismatic','Cheerful','Competitive',
    'Confident','Conservative',
  ];

  final List<String> selectedTraits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF3EB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Icon(Icons.help_outline, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'How would you describe your personality?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Select upto 5 traits to show off your personality!',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: traits.map((trait) {
                    final bool isSelected = selectedTraits.contains(trait);
                    return ChoiceChip(
                      label: Text(trait),
                      selectedColor: Colors.orange.shade200,
                      backgroundColor: Colors.grey.shade200,
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            if (selectedTraits.length < 5) {
                              selectedTraits.add(trait);
                            }
                          } else {
                            selectedTraits.remove(trait);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedTraits.isEmpty
                      ? Colors.orange.shade100
                      : Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (selectedTraits.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select at least one trait"),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BioScreen(),
                      ),
                    );
                  }
                },
                child: const Text("Select",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BioScreen()),
                  );
                },
                child: const Text("Skip", style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
