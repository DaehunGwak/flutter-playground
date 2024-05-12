import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controller.dart';
import 'model.dart';

// TODO: MVC 패턴을 MVVM 패턴으로 변경하여 카운터 앱이 동작하도록 변경하세요.

class CounterView extends StatefulWidget {
  final CounterController counterController;
  final CounterModeController counterModeController;

  const CounterView({
    super.key,
    required this.counterController,
    required this.counterModeController,
  });

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MVVM'),
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
            Text(
              widget.counterController.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: execute,
        child: Icon(widget.counterModeController.counterMode.icon),
      ),
    );
  }

  void onChangedMode() {
    setState(() {
      widget.counterModeController.toggleMode();
    });
  }

  void execute() {
    setState(() {
      switch (widget.counterModeController.counterMode) {
        case CounterMode.plus:
          widget.counterController.increment();
        case CounterMode.minus:
          widget.counterController.decrement();
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
