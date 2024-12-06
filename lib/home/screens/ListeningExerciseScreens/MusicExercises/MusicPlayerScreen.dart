// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String songTitle;
  final String artist;
  final String audioPath;

  const MusicPlayerScreen({
    super.key,
    required this.songTitle,
    required this.artist,
    required this.audioPath,
  });

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    // Load the song and play it
    _playAudio();
  }

  void _playAudio() async {
    await _audioPlayer.setSource(AssetSource(widget.audioPath));
    await _audioPlayer.resume(); // Start playback
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(
        title: const Text("Now Playing"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Album Art Placeholder
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/images/mad.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Song Details
          Text(
            widget.songTitle,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            widget.artist,
            style: const TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 20),
          // Seek Bar
          Slider(
            value: _position.inSeconds.toDouble(),
            max: _duration.inSeconds.toDouble(),
            onChanged: (value) {
              _audioPlayer.seek(Duration(seconds: value.toInt()));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(_position),
                    style: const TextStyle(color: Colors.white)),
                Text(_formatDuration(_duration),
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Play/Pause Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.pause, size: 40, color: Colors.white),
                onPressed: () {
                  _audioPlayer.pause();
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon:
                    const Icon(Icons.play_arrow, size: 40, color: Colors.white),
                onPressed: () {
                  _audioPlayer.resume();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds % 60)}";
  }
}
