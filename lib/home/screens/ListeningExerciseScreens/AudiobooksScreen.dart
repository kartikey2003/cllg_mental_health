// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AudiobooksScreen extends StatelessWidget {
  const AudiobooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Audiobooks")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.headset, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              "Explore relaxing audiobooks!",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
