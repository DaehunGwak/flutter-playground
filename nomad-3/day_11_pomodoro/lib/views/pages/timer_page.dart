import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).textTheme.titleLarge);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'pmdr.',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
