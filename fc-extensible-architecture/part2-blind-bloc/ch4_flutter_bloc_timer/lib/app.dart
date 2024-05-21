import 'package:ch4_flutter_bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(72, 74, 126, 1),
        ),
        useMaterial3: true,
      ),
      home: const TimerPage(),
    );
  }
}
