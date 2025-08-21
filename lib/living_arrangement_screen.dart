import 'package:flutter/material.dart';
import 'complete_profile_tagline.dart';

class LivingArrangementScreen extends StatefulWidget {
  const LivingArrangementScreen({super.key});

  @override
  State<LivingArrangementScreen> createState() =>
      _LivingArrangementScreenState();
}

class _LivingArrangementScreenState extends State<LivingArrangementScreen> {
  String? selectedOption;

  final List<String> options = [
    "Will get our own place",
    "Open to live with my parents",
    "Plan to live with my parents",
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 26),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Title
            Center(
              child: Text(
                "Living Arrangements",
                style: TextStyle(
                  fontSize: width * 0.055,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: height * 0.025),

            // Options List
            Expanded(
              child: ListView.separated(
                itemCount: options.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.8,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final option = options[index];
                  final isSelected = selectedOption == option;

                  return ListTile(
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: width * 0.043,
                        color: isSelected ? Colors.redAccent : Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check,
                            color: Colors.redAccent, size: 22)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                  );
                },
              ),
            ),

            // Update Button
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06, vertical: height * 0.025),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (selectedOption != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CompleteProfileTagline(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
