import 'package:flutter/material.dart';
import 'my_event_screen.dart';

class UpcomingEventScreen extends StatefulWidget {
  const UpcomingEventScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingEventScreen> createState() => _UpcomingEventScreenState();
}

class _UpcomingEventScreenState extends State<UpcomingEventScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.close, color: Colors.black),
                  const SizedBox(width: 12),
                  const Text(
                    "Events",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Tabs (Upcoming / My Events)
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: "Upcoming"),
                  Tab(text: "My events"),
                ],
                onTap: (index) {
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyEventScreen()),
                    );
                  }
                },
              ),
            ),

            const SizedBox(height: 10),

            // Around the world text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Around the world",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Events List Scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _eventCard(
                      size,
                      "London, GB",
                      "Candle light Iftar gathering | Muna x NDP",
                      "31/07/2025 7:00PM GMT +1",
                      "NDP garden, 13 high hallburn, London",
                      "assets/images/iftar_event.jpg",
                    ),
                    const SizedBox(height: 16),
                    _eventCard(
                      size,
                      "London, GB",
                      "Community Meetup | London Techies",
                      "05/08/2025 5:00PM GMT +1",
                      "Tech Park, 45 Green Street, London",
                      "assets/images/meetup_event.jpg",
                    ),
                  ],
                ),
              ),
            ),

            // Custom Bottom Navbar (Social active)
            Container(
              height: 70,
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navbarIcon('assets/images/marriage_icon.png'),
                  navbarIcon('assets/images/explore_icon.png'),
                  navbarIcon('assets/images/social_icon.png',
                      isActive: true), // 👈 Social active
                  navbarIcon('assets/images/chat_icon.png'),
                  navbarIcon('assets/images/menu_icon.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _eventCard(Size size, String location, String title, String date,
      String address, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on,
                    size: 16, color: Colors.white70),
                const SizedBox(width: 5),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today,
                    size: 14, color: Colors.white70),
                const SizedBox(width: 5),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              address,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
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
