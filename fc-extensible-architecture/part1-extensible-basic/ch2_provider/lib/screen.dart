import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final CounterModel counterModel = context.read<CounterModel>();
    final CounterModeModel modeModel = context.read<CounterModeModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('provider'),
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
        onPressed: () => execute(counterModel, modeModel),
        child: Icon(modeModel.counterMode.icon),
      ),
    );
  }

  void onChangedMode(CounterModeModel modeModel) {
    setState(() {
      modeModel.toggleMode();
    });
  }

  void execute(CounterModel counterModel, CounterModeModel modeModel) {
    setState(() {
      switch (modeModel.counterMode) {
        case CounterMode.plus:
          counterModel.increment();
        case CounterMode.minus:
          counterModel.decrement();
      }
    });
  }
}

extension on CounterMode {
  IconData get icon {
    switch (this) {
      case CounterMode.plus:
        return CupertinoIcons.add;
      case CounterMode.minus:
        return CupertinoIcons.minus;
    }
  }
}
