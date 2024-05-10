import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setUpGetItModels() {
  locator.registerSingleton<GetItCounterModel>(GetItCounterModel());
  locator.registerSingleton(GetItCounterModeModel());
}

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
