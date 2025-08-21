import 'package:flutter/material.dart';
import 'profile_edit_screen.dart';
import 'id_verification_screen.dart';

class ViewPrewScreen extends StatelessWidget {
  const ViewPrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Full-screen Profile Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/sample_user.png",
              fit: BoxFit.cover,
            ),
          ),

          /// Overlay Content
          SafeArea(
            child: Column(
              children: [
                /// ----- Header -----
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Back Button
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                      /// Name + verified badge
                      Row(
                        children: const [
                          Text(
                            "Lina Zahara",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.verified, color: Colors.green, size: 18),
                        ],
                      ),

                      /// Share Button
                      IconButton(
                        icon: const Icon(Icons.share_outlined, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                /// ----- Tabs (Preview / Edit) -----
                Container(
                  color: Colors.grey.shade200.withOpacity(0.8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                          child: const Text(
                            "Preview",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileEditScreen()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            alignment: Alignment.center,
                            child: const Text(
                              "Edit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Spacer to push content to the bottom
                const Spacer(),

                /// ----- User Info -----
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Lina Zahara",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "29",
                            style: TextStyle(fontSize: 20, color: Colors.black54),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.verified, color: Colors.blue, size: 18),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "📍 268 KM AWAY, ISLAMABAD, PAKISTAN",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      const SizedBox(height: 12),

                      /// Tags
                      Wrap(
                        spacing: 8,
                        children: const [
                          Chip(
                            label: Text("Active today"),
                            backgroundColor: Colors.greenAccent,
                          ),
                          Chip(
                            label: Text("Actor"),
                            backgroundColor: Colors.grey,
                          ),
                          Chip(
                            label: Text("Strictly Practicing"),
                            backgroundColor: Colors.grey,
                          ),
                          Chip(
                            label: Text("Pakistani"),
                            backgroundColor: Colors.grey,
                          ),
                          Chip(
                            label: Text("Kashmiri"),
                            backgroundColor: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// ----- Boost Profile Button -----
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IdVerificationScreen()),
                        );
                      },
                      child: const Text(
                        "Boost my profile",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
