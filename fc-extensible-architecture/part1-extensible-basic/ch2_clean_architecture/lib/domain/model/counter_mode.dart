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

class CounterModeModel {
  CounterMode _counterMode = CounterMode.plus;

  CounterMode get counterMode => _counterMode;

  void toggleMode() {
    _counterMode = _counterMode.next();
  }
}
