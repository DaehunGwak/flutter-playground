import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view_model.dart';
import 'model.dart';

class CounterView extends StatelessWidget {
  final CounterViewModel counterViewModel;

  const CounterView({
    super.key,
    required this.counterViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MVVM'),
        actions: [
          IconButton(
            onPressed: counterViewModel.toggleMode,
            icon: const Icon(CupertinoIcons.arrow_2_squarepath),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder(
              valueListenable: counterViewModel.counterModel,
              builder: (context, counterModel, child) => Text(
                counterModel.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterViewModel.execute,
        child: ValueListenableBuilder(
          valueListenable: counterViewModel.counterModeModel,
          builder: (context, counterModeModel, child) =>
              Icon(counterModeModel.counterMode.icon),
        ),
      ),
    );
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
