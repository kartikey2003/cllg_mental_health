// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mental_heal_app/home/screens/ListeningExerciseScreens/MusicExercises/MusicPlayerScreen.dart';

class MusicTherapyScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      "title": "Motivational Song 1",
      "artist": "Artist 1",
      "path": "songs/song1.mp3"
    },
    {
      "title": "Motivational Song 2",
      "artist": "Artist 2",
      "path": "songs/song2.mp3"
    },
    {
      "title": "Motivational Song 3",
      "artist": "Artist 3",
      "path": "songs/song3.mp3"
    },
    // Add more songs here
  ];

  MusicTherapyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music Therapy")),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading:
                  const Icon(Icons.music_note, size: 40, color: Colors.blue),
              title: Text(song["title"]!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(song["artist"]!),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicPlayerScreen(
                      songTitle: song["title"]!,
                      artist: song["artist"]!,
                      audioPath: song["path"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
