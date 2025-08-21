import 'package:flutter/material.dart';

class CompleteProfileGrewupScreen extends StatelessWidget {
  const CompleteProfileGrewupScreen({super.key});

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
          "Grew up in",
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
              children: const [
                ListTile(
                  title: Text(
                    "No Preference",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  trailing: Icon(Icons.check, color: Colors.redAccent),
                ),
                Divider(),
                ListTile(title: Text("Afghanistan")),
                ListTile(title: Text("Albania")),
                ListTile(title: Text("Algeria")),
                ListTile(title: Text("American Somoa")),
                ListTile(title: Text("Andorra")),
                ListTile(title: Text("Angola")),
                ListTile(title: Text("Argentina")),
                ListTile(
                  title: Text(
                    "Armenia",
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
                  Navigator.pushNamed(context, '/complete_profile_children');
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
