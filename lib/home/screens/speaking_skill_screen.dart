// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:just_audio/just_audio.dart';
// import 'package:http/http.dart' as http;

// class VoiceBotScreen extends StatefulWidget {
//   const VoiceBotScreen({super.key});

//   @override
//   _VoiceBotScreenState createState() => _VoiceBotScreenState();
// }

// class _VoiceBotScreenState extends State<VoiceBotScreen> {
//   final stt.SpeechToText _speech = stt.SpeechToText();
//   bool _isListening = false;
//   String _text = "";
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   @override
//   void initState() {
//     super.initState();
//   }

//   // Start listening to speech
//   void _startListening() async {
//     bool available = await _speech.initialize();
//     if (available) {
//       setState(() {
//         _isListening = true;
//       });
//       _speech.listen(onResult: (result) {
//         setState(() {
//           _text = result.recognizedWords;
//         });
//         _sendToBackend(_text); // Send the recognized text to the backend
//       });
//     }
//   }

//   // Stop listening
//   void _stopListening() {
//     _speech.stop();
//     setState(() {
//       _isListening = false;
//     });
//   }

//   // Send text to the Python backend for AI response and play TTS
//   void _sendToBackend(String text) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:5000/chat'),
//       headers: {'Content-Type': 'application/json'},
//       body: '{"text": "$text"}',
//     );
//     if (response.statusCode == 200) {
//       String audioUrl = response
//           .body; // Assuming the response contains an audio file URL or audio data
//       _playAudio(audioUrl);
//     } else {
//       print('Failed to get response from backend');
//     }
//   }

//   // Play TTS audio
//   void _playAudio(String audioUrl) async {
//     await _audioPlayer.setUrl(audioUrl);
//     _audioPlayer.play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('VoiceBot')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_text),
//             ElevatedButton(
//               onPressed: _isListening ? _stopListening : _startListening,
//               child: Text(_isListening ? 'Stop Listening' : 'Start Listening'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
