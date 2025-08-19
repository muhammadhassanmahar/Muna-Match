import 'package:flutter/material.dart';
import 'package:muna_match/height_screen.dart';

class NationalityScreen extends StatefulWidget {
  const NationalityScreen({super.key});

  @override
  State<NationalityScreen> createState() => _NationalityScreenState();
}

class _NationalityScreenState extends State<NationalityScreen> {
  final List<String> allCountries = [
    "Abarundi",
    "Afghan",
    "Albanian",
    "Algeria",
    "Austria",
    "Azerbaijan",
    "Bangladesh",
    "Canada",
    "China",
    "France",
    "Germany",
    "India",
    "Pakistan",
    "Turkey",
    "United Kingdom",
    "United States"
  ];

  final List<String> selectedCountries = [];
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredCountries = allCountries
        .where((country) =>
            country.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Icon(Icons.help_outline, color: Colors.black54),
                ],
              ),
              const SizedBox(height: 10),

              // Title
              const Text(
                "What’s your nationality?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                "Please tell us up to two countries you hold citizenship with.",
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              const SizedBox(height: 20),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for nationalities",
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 15),

              // List of countries
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];
                    final isSelected = selectedCountries.contains(country);

                    return CheckboxListTile(
                      title: Text(
                        country,
                        style: const TextStyle(fontSize: 16),
                      ),
                      value: isSelected,
                      activeColor: Colors.orange,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            if (selectedCountries.length < 2) {
                              selectedCountries.add(country);
                            }
                          } else {
                            selectedCountries.remove(country);
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                    );
                  },
                ),
              ),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedCountries.isNotEmpty
                        ? const Color(0xFFFF6B5C)
                        : Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: selectedCountries.isNotEmpty
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HeightScreen()),
                          );
                        }
                      : null,
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
