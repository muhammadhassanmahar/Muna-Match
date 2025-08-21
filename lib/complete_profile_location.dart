import 'package:flutter/material.dart';

class CompleteProfileLocationScreen extends StatelessWidget {
  const CompleteProfileLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Location",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Clear",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs (Country | Distance)
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Country",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: const Text(
                      "Distance",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Info message
          Container(
            width: double.infinity,
            color: Colors.black87,
            padding: const EdgeInsets.all(8),
            child: const Text(
              "You will only be seen by members searching in Pakistan",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Countries",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Country list
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Text("🇵🇰"),
                  title: const Text("Pakistan"),
                  subtitle: const Text(
                    "We’ll always priorities members from your home country. ",
                  ),
                  trailing: const Text(
                    "Upgrade to Gold",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
                const Divider(),
                const ListTile(title: Text("Afghanistan")),
                const ListTile(title: Text("Albania")),
                const ListTile(title: Text("Algeria")),
                const ListTile(title: Text("American Somoa")),
                const ListTile(title: Text("Andorra")),
                const ListTile(
                  title: Text(
                    "Angola",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),

          // Confirm button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/complete_profile_grewup');
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
