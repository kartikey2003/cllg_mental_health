// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mental_heal_app/home/screens/ListeningExerciseScreens/VideoPlayerScreen.dart';

class StorytellingScreen extends StatelessWidget {
  const StorytellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Storytelling")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VideoTile(
              title: "Story Video 1",
              thumbnail:
                  "assets/images/tumb1.jpg", // Add a thumbnail for the video
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoPlayerScreen(
                      videoPath: "assets/story_motivational_videos/v1.mp4",
                    ),
                  ),
                );
              },
            ),
            VideoTile(
              title: "Story Video 2",
              thumbnail:
                  "assets/images/thumb2.jpg", // Add a thumbnail for the video
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoPlayerScreen(
                      videoPath: "assets/story_motivational_videos/v2.mp4",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VideoTile extends StatelessWidget {
  final String title;
  final String thumbnail;
  final VoidCallback onTap;

  const VideoTile(
      {super.key,
      required this.title,
      required this.thumbnail,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      child: ListTile(
        leading: Image.asset(
          thumbnail,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.play_arrow),
        onTap: onTap,
      ),
    );
  }
}
