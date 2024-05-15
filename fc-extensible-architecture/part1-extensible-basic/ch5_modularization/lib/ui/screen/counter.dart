import 'package:ch5_modularization/domain/domain.dart';
import 'package:ch5_modularization/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CounterView extends StatelessWidget {
  final CounterViewModel counterViewModel;
  final CounterModeViewModel counterModeViewModel;

  const CounterView({
    super.key,
    required this.counterViewModel,
    required this.counterModeViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Modularization'),
        actions: [
          IconButton(
            onPressed: onChangedMode,
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
            ValueListenableBuilder<int>(
              valueListenable: counterViewModel.counter,
              builder: (context, counter, child) => Text(
                counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: execute,
        child: ValueListenableBuilder<CounterMode>(
          valueListenable: counterModeViewModel.counterMode,
          builder: (context, counterMode, child) => Icon(counterMode.icon),
        ),
      ),
    );
  }

  void onChangedMode() {
    counterModeViewModel.toggleMode();
  }

  void execute() {
    switch (counterModeViewModel.counterMode.value) {
      case CounterMode.plus:
        counterViewModel.increment();
      case CounterMode.minus:
        counterViewModel.decrement();
    }
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
