import 'package:flutter/material.dart';

class CompleteProfileSect extends StatefulWidget {
  const CompleteProfileSect({super.key});

  @override
  State<CompleteProfileSect> createState() => _CompleteProfileSectState();
}

class _CompleteProfileSectState extends State<CompleteProfileSect> {
  String? selectedSect;

  final List<String> sects = [
    "No Preference",
    "Sunni",
    "Sunni (Hanafi)",
    "Sunni (Maliki)",
    "Sunni (Shafi)",
    "Sunni (Hanbali)",
    "Shia",
    "Shia (Twelver)",
    "Shia (Ismaili)",
    "Shia (zaydi)",
    "Sufi",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7F2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Sect",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedSect = null;
              });
            },
            child: const Text(
              "Clear",
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: sects.length,
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemBuilder: (context, index) {
                final sect = sects[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    sect,
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedSect == sect
                          ? const Color(0xFFFF6F61)
                          : Colors.black87,
                      fontWeight: selectedSect == sect
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  trailing: selectedSect == sect
                      ? const Icon(Icons.check, color: Color(0xFFFF6F61))
                      : null,
                  onTap: () {
                    setState(() {
                      selectedSect = sect;
                    });
                  },
                );
              },
            ),
          ),

          // Update Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedSect == null
                    ? null
                    : () {
                        Navigator.pushNamed(context, "/complete_profile_location");
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6F61),
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
