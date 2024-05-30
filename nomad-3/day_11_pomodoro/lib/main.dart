import 'package:day_11_pomodoro/views/pages/timer_page.dart';
import 'package:day_11_pomodoro/views/shared/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PmdrApp());
}

class PmdrApp extends StatelessWidget {
  const PmdrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pmdr.',
      theme: lightTheme,
      home: const TimerPage(),
    );
  }
}
