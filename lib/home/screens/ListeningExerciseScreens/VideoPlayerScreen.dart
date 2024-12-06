// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {}); // Refresh to show the initialized video
        _controller.play(); // Start playing automatically
      });
    _controller.addListener(() {
      if (!_isDragging) {
        setState(() {}); // Update UI with the current position
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
        backgroundColor: Colors.blue.shade50,
      ),
      body: Container(
        color: Colors.lightBlue[50], // Set light blue background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Video Player
            Expanded(
              child: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
            // Video Progress Slider
            Column(
              children: [
                Slider(
                  value: _controller.value.isInitialized
                      ? _controller.value.position.inSeconds.toDouble()
                      : 0.0,
                  max: _controller.value.isInitialized
                      ? _controller.value.duration.inSeconds.toDouble()
                      : 1.0,
                  onChanged: (value) {
                    setState(() {
                      _isDragging = true;
                    });
                    _controller.seekTo(Duration(seconds: value.toInt()));
                  },
                  onChangeEnd: (_) {
                    setState(() {
                      _isDragging = false;
                    });
                  },
                ),
                // Video Time Display
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _controller.value.isInitialized
                            ? _formatDuration(_controller.value.position)
                            : "0:00",
                      ),
                      Text(
                        _controller.value.isInitialized
                            ? _formatDuration(_controller.value.duration)
                            : "0:00",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Play/Pause Button
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper method to format duration to mm:ss
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
