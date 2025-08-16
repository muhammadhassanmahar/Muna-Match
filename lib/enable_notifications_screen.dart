import 'package:flutter/material.dart';

class EnableNotificationsScreen extends StatelessWidget {
  const EnableNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_active,
              size: height * 0.15,
              color: Colors.deepPurple,
            ),
            SizedBox(height: height * 0.04),

            Text(
              "Enable Notifications",
              style: TextStyle(
                fontSize: height * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.02),

            Text(
              "Stay updated with important alerts and updates. "
              "We’ll notify you about matches and new messages.",
              style: TextStyle(
                fontSize: height * 0.018,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.05),

            // Allow Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Yahan aap agle screen ka navigation lagao
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Allow",
                  style: TextStyle(
                    fontSize: height * 0.02,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            // Skip for now
            TextButton(
              onPressed: () {
                // Navigation to next screen
                // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
              },
              child: Text(
                "Skip for now",
                style: TextStyle(
                  fontSize: height * 0.018,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
