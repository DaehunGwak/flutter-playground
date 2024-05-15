import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

class CounterViewModel {
  final ValueNotifier<CounterModel> _counterModel;

  final ValueNotifier<CounterModeModel> _counterModeModel;

  CounterViewModel({
    required CounterModel counterModel,
    required CounterModeModel counterModeModel,
  })  : _counterModel = ValueNotifier(counterModel),
        _counterModeModel = ValueNotifier(counterModeModel);

  ValueNotifier<CounterModel> get counterModel => _counterModel;

  ValueNotifier<CounterModeModel> get counterModeModel => _counterModeModel;

  void execute() {
    switch (_counterModeModel.value.counterMode) {
      case CounterMode.plus:
        _counterModel.value = _counterModel.value.increment();
      case CounterMode.minus:
        _counterModel.value = _counterModel.value.decrement();
    }
  }

  void toggleMode() {
    _counterModeModel.value = _counterModeModel.value.toggleMode();
  }
}
