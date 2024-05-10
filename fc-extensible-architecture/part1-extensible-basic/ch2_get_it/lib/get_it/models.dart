import 'package:injectable/injectable.dart';

@singleton
class GetItCounterModel {
  int _counter = 0;

  int get counter => _counter;

  void increase() {
    _counter++;
  }

  void decrease() {
    _counter--;
  }
}

@singleton
class GetItCounterModeModel {
  GetItCounterMode _mode = GetItCounterMode.plus;

  GetItCounterMode get mode => _mode;

  void toggle() {
    _mode = _mode.next();
  }
}

enum GetItCounterMode {
  plus,
  minus;

  GetItCounterMode next() {
    switch (this) {
      case GetItCounterMode.plus:
        return GetItCounterMode.minus;
      case GetItCounterMode.minus:
        return GetItCounterMode.plus;
    }
  }
}
