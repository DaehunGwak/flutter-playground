import 'package:animation_music_player/screens/music_player_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationMusicPlayerApp());
}

class AnimationMusicPlayerApp extends StatelessWidget {
  const AnimationMusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MusicPlayerScreen(),
    );
  }
}
