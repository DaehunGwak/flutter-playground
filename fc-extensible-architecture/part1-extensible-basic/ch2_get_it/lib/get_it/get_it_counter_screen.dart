import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class GetItCounterScreen extends StatefulWidget {
  const GetItCounterScreen({super.key});

  @override
  State<GetItCounterScreen> createState() => _GetItCounterScreenState();
}

class _GetItCounterScreenState extends State<GetItCounterScreen> {
  @override
  Widget build(BuildContext context) {
    final counterModel = locator<GetItCounterModel>();
    final modeModel = locator<GetItCounterModeModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('get_it'),
        actions: [
          IconButton(
            onPressed: () => onChangedMode(modeModel),
            icon: const Icon(CupertinoIcons.arrow_2_squarepath),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counterModel.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => execute(counterModel, modeModel.mode),
        child: Icon(modeModel.mode.icon),
      ),
    );
  }

  void onChangedMode(GetItCounterModeModel modeModel) {
    setState(() {
      modeModel.toggle();
    });
  }

  void execute(GetItCounterModel counterModel, GetItCounterMode mode) {
    setState(() {
      switch (mode) {
        case GetItCounterMode.plus:
          counterModel.increase();
        case GetItCounterMode.minus:
          counterModel.decrease();
      }
    });
  }
}

extension on GetItCounterMode {
  IconData get icon {
    switch (this) {
      case GetItCounterMode.plus:
        return CupertinoIcons.add;
      case GetItCounterMode.minus:
        return CupertinoIcons.minus;
    }
  }
}
