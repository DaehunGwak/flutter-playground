import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: MVC 패턴을 적용하여 카운터 앱이 동작하도록 변경하세요.
// - 단, View 내에 변수는 없어야 한다. (ex. counter)

enum CounterMode {
  plus,
  minus;

  CounterMode next() {
    switch (this) {
      case CounterMode.plus:
        return CounterMode.minus;
      case CounterMode.minus:
        return CounterMode.plus;
    }
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;
  CounterMode counterMode = CounterMode.plus;

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
              counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: execute,
        child: Icon(counterMode.icon),
      ),
    );
  }

  void onChangedMode() {
    setState(() {
      counterMode = counterMode.next();
    });
  }

  void execute() {
    setState(() {
      switch (counterMode) {
        case CounterMode.plus:
          counter++;
        case CounterMode.minus:
          counter--;
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
