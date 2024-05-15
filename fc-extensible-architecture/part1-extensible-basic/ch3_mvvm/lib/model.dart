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

// TODO: field 자체를 ValueNotifier 로 바꿔서 연쇄적으로 일으킬수도 있을 듯
class CounterModel {
  final int _counter;

  CounterModel({int counter = 0}): _counter = counter;

  int get counter => _counter;

  CounterModel increment() {
    return CounterModel(counter: _counter + 1);
  }

  CounterModel decrement() {
    return CounterModel(counter: _counter - 1);
  }
}

class CounterModeModel {
  final CounterMode _counterMode;

  CounterModeModel({CounterMode counterMode = CounterMode.plus})
      : _counterMode = counterMode;

  CounterMode get counterMode => _counterMode;

  CounterModeModel toggleMode() {
    return CounterModeModel(counterMode: _counterMode.next());
  }
}
