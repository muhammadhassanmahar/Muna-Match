import 'package:flutter/material.dart';
import 'education_screen.dart';

class ProfessionScreen extends StatefulWidget {
  const ProfessionScreen({super.key});

  @override
  State<ProfessionScreen> createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {
  final List<String> professions = [
    "Accountant",
    "Acting Professional",
    "Actor",
    "Administration Employee",
    "Administration Proffessional",
    "Air Hostess",
    "Architect",
  ];

  String selectedProfession = '';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredProfessions = professions
        .where((job) => job.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new, size: 20),
                  const Spacer(),
                  Icon(Icons.help_outline, color: Colors.grey[700]),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "What’s your proffession?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (val) {
                  setState(() {
                    searchQuery = val;
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search jobs',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredProfessions.length,
                  itemBuilder: (context, index) {
                    final profession = filteredProfessions[index];
                    return ListTile(
                      title: Text(
                        profession,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedProfession = profession;
                        });
                      },
                      selected: selectedProfession == profession,
                      selectedTileColor: const Color(0xFFD7B49E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedProfession.isNotEmpty
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EducationScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: selectedProfession.isNotEmpty
                        ? const Color(0xFFFFCDBE)
                        : const Color(0xFFFFCDBE).withValues(alpha: 0.5),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
