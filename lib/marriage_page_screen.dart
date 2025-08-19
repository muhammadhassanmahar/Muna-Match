import 'package:flutter/material.dart';

class MarriagePageScreen extends StatelessWidget {
  const MarriagePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marriage Page"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome to the Marriage Page!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // yahan navigation add karna ho to karo
                // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
