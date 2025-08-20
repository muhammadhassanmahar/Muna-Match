import 'package:flutter/material.dart';

class MarriagePageScreen extends StatelessWidget {
  const MarriagePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Profile Card
            Expanded(
              child: Stack(
                children: [
                  // Background image (replace with your profile image)
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/profile_image.png'), // <-- your image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 220,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87],
                        ),
                      ),
                    ),
                  ),
                  // Top Badges
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Image.asset('assets/not_boosted_badge.png', height: 30),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Image.asset('assets/eye_icon.png', height: 30),
                  ),
                  // User Info
                  Positioned(
                    bottom: 100,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Azaan Ali",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.verified, color: Colors.blue, size: 20),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "268 KM AWAY, ISLAMABAD, PAKISTAN",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        const SizedBox(height: 12),
                        // Tags
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            tag("Active today"),
                            tag("Actor"),
                            tag("Strictly Practicing"),
                            tag("Pakistani"),
                            tag("Kashmiri"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Like/Dislike Buttons
                  Positioned(
                    bottom: 30,
                    left: 30,
                    right: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/dislike.png', height: 50), // Cross icon
                        Image.asset('assets/boost.png', height: 50),   // Boost icon
                        Image.asset('assets/like.png', height: 50),    // Tick icon
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Navbar
            Container(
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navbarIcon('assets/marriage_icon.png', isActive: true),
                  navbarIcon('assets/explore_icon.png', onTap: () {
                    Navigator.pushNamed(context, '/explore_like_screen');
                  }),
                  navbarIcon('assets/social_icon.png'),
                  navbarIcon('assets/chat_icon.png'),
                  navbarIcon('assets/menu_icon.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Custom Tag Widget
  Widget tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  // Bottom Navbar Icon Builder
  Widget navbarIcon(String assetPath, {bool isActive = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 24,
            color: isActive ? Colors.orange : Colors.grey,
          ),
          const SizedBox(height: 4),
          if (isActive)
            Container(
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrangeAccent,
              ),
            ),
        ],
      ),
    );
  }
}
