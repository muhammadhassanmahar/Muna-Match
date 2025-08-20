import 'package:flutter/material.dart';
import 'favourited_screen.dart';

class VisitedYouScreen extends StatefulWidget {
  const VisitedYouScreen({super.key});

  @override
  State<VisitedYouScreen> createState() => _VisitedYouScreenState();
}

class _VisitedYouScreenState extends State<VisitedYouScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);

    // Favourited tab navigation
    _tabController.addListener(() {
      if (_tabController.index == 2 && _tabController.indexIsChanging) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FavouritedScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Tabs
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    tabs: const [
                      Tab(text: "Liked you"),
                      Tab(text: "Visited you"),
                      Tab(text: "Favourited"),
                    ],
                  ),
                ],
              ),
            ),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const Center(child: Text("Liked you screen")),
                  visitedYouTab(),
                  const Center(child: Text("Favourited screen")), // Dummy (navigate hota hai)
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
                  navbarIcon('assets/images/marriage_icon.png'),
                  navbarIcon('assets/images/explore_icon.png', isActive: true),
                  navbarIcon('assets/images/social_icon.png'),
                  navbarIcon('assets/images/chat_icon.png'),
                  navbarIcon('assets/images/menu_icon.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// ----- Tab Content -----
  Widget visitedYouTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Visited you",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          "These people have viewed your profile recently.",
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  "Gold members get double\nthe daily profile visits",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {},
                child: const Text("Get more visits"),
              )
            ],
          ),
        ),
      ],
    );
  }

  /// ----- Bottom Navbar -----
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
