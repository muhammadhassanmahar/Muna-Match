import 'package:flutter/material.dart';
import 'package:muna_match/practisce_religion_screen.dart';

class DressScreen extends StatefulWidget {
  const DressScreen({super.key});

  @override
  State<DressScreen> createState() => _DressScreenState();
}

class _DressScreenState extends State<DressScreen> {
  int? selectedIndex;

  final List<String> dressOptions = [
    "No religious dress",
    "Modest",
    "Jilbab",
    "Niqab",
    "Hijab",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF5EE),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.help_outline, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Bar
            Container(
              width: size.width * 0.3,
              height: 4,
              margin: const EdgeInsets.only(top: 8, bottom: 24),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Heading
            const Text(
              "How do you Dress?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Dress options
            ListView.builder(
              shrinkWrap: true,
              itemCount: dressOptions.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    dressOptions[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: index == 0
                          ? Colors.red
                          : isSelected
                              ? Colors.deepOrange
                              : Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),

            const Spacer(),

            // Continue button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedIndex != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PractiseReligionScreen(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedIndex != null
                      ? Colors.deepOrange
                      : Colors.deepOrange.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16),
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
