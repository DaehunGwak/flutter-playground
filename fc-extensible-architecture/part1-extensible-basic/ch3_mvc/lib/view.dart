import 'package:ch3_mvc/controller.dart';
import 'package:ch3_mvc/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  final CounterController counterController =
      CounterController(CounterModel(), CounterModeModel());

  CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MVC'),
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
        child: Icon(widget.counterController.mode.icon),
      ),
    );
  }

  void onChangedMode() {
    setState(() {
      widget.counterController.toggleMode();
    });
  }

  void execute() {
    setState(() {
      widget.counterController.execute();
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
