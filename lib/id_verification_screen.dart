import 'package:flutter/material.dart';
import 'complete_profile_marriage_screen.dart';

class IdVerificationScreen extends StatelessWidget {
  const IdVerificationScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Close Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              SizedBox(height: height * 0.02),

              // Title
              Text(
                "Become an ID Verified\nmember",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.01),

              // Subtitle
              Text(
                "Scan your ID and take a selfie to prove your identity",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(height: height * 0.04),

              // Feature List
              _buildFeature(
                "Verification badge on your profile",
                width,
              ),
              _buildFeature(
                "Get 47% more matches",
                width,
              ),
              _buildFeature(
                "Be seen and liked by more members",
                width,
              ),

              SizedBox(height: height * 0.03),

              // Info Box
              Container(
                padding: EdgeInsets.all(width * 0.03),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, size: 18, color: Colors.black54),
                    SizedBox(width: width * 0.02),
                    Expanded(
                      child: Text(
                        "We’ll sometimes show you people just outside of this filter",
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Get ID Verified Button
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
                        builder: (_) => const CompleteProfileMarriageScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Get ID Verified",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.015),

              // Cancel Button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: width * 0.045,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(String text, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.015),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.redAccent),
          SizedBox(width: width * 0.02),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
