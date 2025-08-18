import 'package:flutter/material.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int? selectedHeight;

  final List<Map<String, String>> heights = [
    {'cm': '165', 'ft': '5’5”'},
    {'cm': '168', 'ft': '5’6”'},
    {'cm': '170', 'ft': '5’7”'},
    {'cm': '173', 'ft': '5’8”'},
    {'cm': '175', 'ft': '5’9”'},
    {'cm': '178', 'ft': '5’10”'},
    {'cm': '180', 'ft': '5’11”'},
    {'cm': '183', 'ft': '6’0”'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF6EF),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.help_outline, color: Colors.black),
          )
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: LinearProgressIndicator(
            value: 0.3,
            backgroundColor: Color(0xFFE0E0E0),
            valueColor: AlwaysStoppedAnimation(Color(0xFF000000)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How tall are you?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: heights.length,
                itemBuilder: (context, index) {
                  final height = heights[index];
                  final isSelected = selectedHeight == index;

                  return ListTile(
                    onTap: () {
                      setState(() {
                        selectedHeight = index;
                      });
                    },
                    title: Row(
                      children: [
                        Text(
                          '${height['cm']} cm',
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.redAccent : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text('.'),
                        const SizedBox(width: 10),
                        Text(
                          height['ft']!,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.redAccent : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_box, color: Colors.redAccent)
                        : null,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedHeight != null ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedHeight != null
                      ? Colors.redAccent
                      : Colors.redAccent.withAlpha(102), // 102 is ~40% opacity
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
