import 'package:flutter/foundation.dart';

import '../../domain/domain.dart';

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
