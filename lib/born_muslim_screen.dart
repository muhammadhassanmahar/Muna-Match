import 'package:flutter/material.dart';
import 'interest_screen.dart';

class BornMuslimScreen extends StatefulWidget {
  const BornMuslimScreen({super.key}); // Converted 'key' to a super parameter

  @override
  BornMuslimScreenState createState() => BornMuslimScreenState(); // Made class public
}

class BornMuslimScreenState extends State<BornMuslimScreen> { // Made class public
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF3EB), // Light background like design
      appBar: AppBar(
        backgroundColor: Color(0xFFFAF3EB),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(Icons.help_outline, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Were you born a Muslim?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),

            // Option Yes
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = "Yes";
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedOption == "Yes" ? Colors.orange : Colors.black,
                      fontWeight: selectedOption == "Yes"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  if (selectedOption == "Yes")
                    Icon(Icons.check_circle, color: Colors.orange),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Option No
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = "No";
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "No",
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedOption == "No" ? Colors.orange : Colors.black,
                      fontWeight: selectedOption == "No"
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  if (selectedOption == "No")
                    Icon(Icons.check_circle, color: Colors.orange),
                ],
              ),
            ),

            Spacer(),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedOption == null
                      ? Colors.orange.shade100
                      : Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (selectedOption == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select an option")),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InterestScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
