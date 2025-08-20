import 'package:flutter/material.dart';
import 'view_prew_screen.dart';

class UserProfileMenu extends StatelessWidget {
  const UserProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// ----- Profile Header -----
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Lina Zahara",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(width: 4),
                Icon(Icons.verified, color: Colors.blue, size: 20),
              ],
            ),
            const Text(
              "View Profile",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            /// ----- Gold Banner -----
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Gold members find their partners faster",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("Learn More"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// ----- Stats Section -----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                statsCard(
                  title: "50",
                  subtitle: "View Profile\nGo unlimited with Gold",
                  color: Colors.pink.shade50,
                  buttonText: "Upgrade",
                ),
                statsCard(
                  title: "0",
                  subtitle: "Compliments\nGet a free credit everyday with Gold",
                  color: Colors.pink.shade50,
                  buttonText: "Upgrade",
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// ----- Edit Profile -----
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewPrewScreen()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.edit, size: 18, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),

            const Spacer(),

            /// ----- Bottom Navbar (same as ExploreScreen) -----
            Container(
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navbarIcon('assets/images/marriage_icon.png'),
                  navbarIcon('assets/images/explore_icon.png'),
                  navbarIcon('assets/images/social_icon.png'),
                  navbarIcon('assets/images/chat_icon.png'),
                  navbarIcon('assets/images/menu_icon.png', isActive: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ----- Stats Card Widget -----
  static Widget statsCard({
    required String title,
    required String subtitle,
    required Color color,
    required String buttonText,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// ----- Bottom Navbar -----
  static Widget navbarIcon(String assetPath,
      {bool isActive = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 24,
            color: isActive ? Colors.deepOrange : Colors.grey,
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
