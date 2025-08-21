import 'package:flutter/material.dart';

class CompleteProfileLanguage extends StatefulWidget {
  const CompleteProfileLanguage({super.key});

  @override
  State<CompleteProfileLanguage> createState() => _CompleteProfileLanguageState();
}

class _CompleteProfileLanguageState extends State<CompleteProfileLanguage> {
  String? selectedLanguage;
  final TextEditingController _searchController = TextEditingController();

  final List<String> allLanguages = [
    "Arabic",
    "Azerbaijani",
    "Bengali",
    "English",
    "French",
    "Hindi",
    "Indonesian",
    "Malay",
    "Russian",
    "Turkish",
    "Urdu",
    "Traditional Chinese",
    "Tamil",
    "Persian",
  ];

  List<String> filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    filteredLanguages = allLanguages;
    _searchController.addListener(_filterLanguages);
  }

  void _filterLanguages() {
    setState(() {
      filteredLanguages = allLanguages
          .where((lang) =>
              lang.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F2), // same background
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7F2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Languages",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search language",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: false,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
            ),
          ),

          // List of languages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: filteredLanguages.length,
              itemBuilder: (context, index) {
                final lang = filteredLanguages[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    lang,
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedLanguage == lang
                          ? const Color(0xFFFF6F61)
                          : Colors.black87,
                      fontWeight: selectedLanguage == lang
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  trailing: selectedLanguage == lang
                      ? const Icon(Icons.check, color: Color(0xFFFF6F61))
                      : null,
                  onTap: () {
                    setState(() {
                      selectedLanguage = lang;
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
                onPressed: selectedLanguage == null
                    ? null
                    : () {
                        Navigator.pushNamed(context, "/complete_profile_sect");
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
