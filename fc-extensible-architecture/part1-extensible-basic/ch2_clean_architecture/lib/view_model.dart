import 'package:flutter/cupertino.dart';

import 'model.dart';

class CounterViewModel {
  final CounterModel _counterModel;

  CounterViewModel(this._counterModel);

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  ValueNotifier<int> get counter => _counter;

  void increment() {
    _counterModel.increment();
    _update();
  }

  void decrement() {
    _counterModel.decrement();
    _update();
  }

  void _update() {
    _counter.value = _counterModel.counter;
  }
}

class CounterModeViewModel {
  final CounterModeModel _counterModeModel;

  CounterModeViewModel(this._counterModeModel);

  final ValueNotifier<CounterMode> _counterMode = ValueNotifier<CounterMode>(CounterMode.plus);

  ValueNotifier<CounterMode> get counterMode => _counterMode;

  void toggleMode() {
    _counterModeModel.toggleMode();
    _update();
  }

  void _update() {
    _counterMode.value = _counterModeModel.counterMode;
  }
}
