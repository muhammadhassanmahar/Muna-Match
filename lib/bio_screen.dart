import 'package:flutter/material.dart';
import 'declaration_screen.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({super.key});

  @override
  State<BioScreen> createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  final TextEditingController _bioController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _bioController.addListener(() {
      setState(() {
        isButtonActive = _bioController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F1), // हल्का क्रीम बैकग्राउंड
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF6F1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black54),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bio",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Add your Bio here....",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: _bioController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Write something about yourself...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: isButtonActive
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeclarationScreen(),
                        ),
                      );
                    }
                  : null,
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isButtonActive
                      ? Colors.orange
                      : Colors.orange.withAlpha(102), // Replaced withOpacity(0.4) with withAlpha(102)
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  "Select",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Skip button → सीधे DeclarationScreen पर जाए
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeclarationScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
