import 'package:day_11_pomodoro/views/widgets/timer_body.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'pmdr.',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const TimerBody(),
    );
  }
}
