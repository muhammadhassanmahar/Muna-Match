import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'about_you_screen.dart';
import 'gender_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key}); // fixed with super parameter

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  int selectedMonthIndex = 0;
  int selectedYearIndex = 0;

  final List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  late List<int> years;

  @override
  void initState() {
    super.initState();
    int currentYear = DateTime.now().year;
    years = List.generate(60, (index) => currentYear - index);
  }

  int calculateAge(int year, int month) {
    DateTime today = DateTime.now();
    int age = today.year - year;
    if (today.month < month || (today.month == month && today.day < 1)) {
      age--;
    }
    return age;
  }

  void onContinue() {
    int age = calculateAge(years[selectedYearIndex], selectedMonthIndex + 1);

    if (age >= 18) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AboutYouScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must be at least 18 years old")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int age = calculateAge(years[selectedYearIndex], selectedMonthIndex + 1);

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF8),
      body: SafeArea(
        child: Column(
          children: [
            // Back Button + Progress + Help
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenderScreen()),
                    );
                  },
                ),
                const Expanded(
                  child: LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Image placeholder
            Image.asset(
              'assets/images/birthday.png', // replace with actual image
              height: 150,
            ),

            const SizedBox(height: 20),

            const Text(
              "When were you born?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Pickers side-by-side
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      backgroundColor: Colors.transparent,
                      itemExtent: 40,
                      onSelectedItemChanged: (index) {
                        setState(() => selectedMonthIndex = index);
                      },
                      scrollController: FixedExtentScrollController(
                          initialItem: selectedMonthIndex),
                      children: months
                          .map((m) => Center(child: Text(m)))
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      backgroundColor: Colors.transparent,
                      itemExtent: 40,
                      onSelectedItemChanged: (index) {
                        setState(() => selectedYearIndex = index);
                      },
                      scrollController: FixedExtentScrollController(
                          initialItem: selectedYearIndex),
                      children: years
                          .map((y) => Center(child: Text(y.toString())))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "You are $age years old",
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: onContinue,
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
