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

class CounterModel {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
  }

  void decrement() {
    _counter--;
  }
}

class CounterModeModel {
  CounterMode _counterMode = CounterMode.plus;

  CounterMode get counterMode => _counterMode;

  void toggleMode() {
    _counterMode = _counterMode.next();
  }
}
