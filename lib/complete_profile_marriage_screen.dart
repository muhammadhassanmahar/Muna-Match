import 'package:flutter/material.dart';
import 'living_arrangement_screen.dart';

class CompleteProfileMarriageScreen extends StatefulWidget {
  const CompleteProfileMarriageScreen({super.key});

  @override
  State<CompleteProfileMarriageScreen> createState() =>
      _CompleteProfileMarriageScreenState();
}

class _CompleteProfileMarriageScreenState
    extends State<CompleteProfileMarriageScreen> {
  String? knowOnMunaMatch;
  String? involveFamily;
  String? marriedWithin;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 26),
                onPressed: () => Navigator.pop(context),
              ),

              SizedBox(height: height * 0.01),

              // Title
              Center(
                child: Text(
                  "Marriage Intention",
                  style: TextStyle(
                    fontSize: width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: height * 0.015),

              // Subtitle
              Text(
                "Select your intentions to help others know how you would like to approach the journey towards marriage!",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: height * 0.035),

              // Section 1
              Text(
                "I’d like to know someone on MunaMatch for",
                style: TextStyle(
                  fontSize: width * 0.042,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.01),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildOption("1-2 months", "know", width),
                  _buildOption("3-4 months", "know", width),
                  _buildOption("4-12 months", "know", width),
                  _buildOption("1-2 years", "know", width),
                ],
              ),

              SizedBox(height: height * 0.03),

              // Section 2
              Text(
                "I’d like to involve family",
                style: TextStyle(
                  fontSize: width * 0.042,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.01),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildOption("Immediately", "family", width),
                  _buildOption("Agree together", "family", width),
                  _buildOption("Later down the line", "family", width),
                ],
              ),

              SizedBox(height: height * 0.03),

              // Section 3
              Text(
                "I’d like to be married within",
                style: TextStyle(
                  fontSize: width * 0.042,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.01),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildOption("1-2 months", "married", width),
                  _buildOption("3-4 months", "married", width),
                  _buildOption("4-12 months", "married", width),
                  _buildOption("1-2 years", "married", width),
                  _buildOption("3-4 years", "married", width),
                  _buildOption("4+ years", "married", width),
                  _buildOption("Agree together", "married", width),
                ],
              ),

              const Spacer(),

              // Confirm Button
              SizedBox(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LivingArrangementScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.025),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String text, String group, double width) {
    bool isSelected = false;

    if (group == "know") isSelected = knowOnMunaMatch == text;
    if (group == "family") isSelected = involveFamily == text;
    if (group == "married") isSelected = marriedWithin == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (group == "know") knowOnMunaMatch = text;
          if (group == "family") involveFamily = text;
          if (group == "married") marriedWithin = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.redAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.redAccent : Colors.grey,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: width * 0.038,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
