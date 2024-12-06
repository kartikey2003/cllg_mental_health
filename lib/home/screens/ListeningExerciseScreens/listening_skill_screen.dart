import 'package:flutter/material.dart';
import 'package:mental_heal_app/home/screens/ListeningExerciseScreens/AudiobooksScreen.dart';
import 'package:mental_heal_app/home/screens/ListeningExerciseScreens/MusicExercises/MusicTherapyScreen.dart';
import 'package:mental_heal_app/home/screens/ListeningExerciseScreens/StorytellingScreen.dart';

class ListeningSkillScreen extends StatelessWidget {
  const ListeningSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listening Exercise"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListeningTile(
              title: "Storytelling",
              icon: Icons.book,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StorytellingScreen()),
                );
              },
            ),
            ListeningTile(
              title: "Audiobooks",
              icon: Icons.headset,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AudiobooksScreen()),
                );
              },
            ),
            ListeningTile(
              title: "Music Therapy",
              icon: Icons.music_note,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicTherapyScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListeningTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ListeningTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
