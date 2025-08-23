import 'package:flutter/material.dart';
import 'chat_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFDF9F3), // cream background
        appBar: AppBar(
          backgroundColor: const Color(0xFFFDF9F3),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Chats",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 2,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Marriage"),
              Tab(text: "Friends"),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text.rich(
                TextSpan(
                  text: "Active Conversations ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: "(5/5)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _chatTile(
                    context,
                    "assets/images/profile1.png",
                    "Azaan",
                    "Hi Azaan, good to match with you!",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatScreen()),
                      );
                    },
                  ),
                  _chatTile(
                    context,
                    "assets/images/profile2.png",
                    "Ali",
                    "Hi Ali, good to match with you!",
                  ),
                  _chatTile(
                    context,
                    "assets/images/profile3.png",
                    "Mohammad",
                    "Hi Mohammad, good to match with you!",
                  ),
                  _chatTile(
                    context,
                    "assets/images/profile4.png",
                    "Ezdan",
                    "Hi ezdan, good to match with you!",
                  ),
                  _chatTile(
                    context,
                    "assets/images/mehmet.png",
                    "Mehmet",
                    "Hi Mehmet, good to match with you!",
                  ),
                ],
              ),
            ),
            // Custom Bottom Navbar
            Container(
              height: 70,
              color: Colors.grey.shade200, // grey background
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navbarIcon('assets/images/marriage_icon.png'),
                  navbarIcon('assets/images/explore_icon.png'),
                  navbarIcon('assets/images/social_icon.png'),
                  navbarIcon('assets/images/chat_icon.png',
                      isActive: true), // chat active
                  navbarIcon('assets/images/menu_icon.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _chatTile(BuildContext context, String img, String name, String msg,
      {VoidCallback? onTap}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(img),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        msg,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      onTap: onTap,
    );
  }

  /// ---- Custom Navbar Icon ----
  Widget navbarIcon(String assetPath,
      {bool isActive = false, VoidCallback? onTap}) {
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
