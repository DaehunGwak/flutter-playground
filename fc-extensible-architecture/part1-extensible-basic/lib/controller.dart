import 'package:ch3_mvc/model.dart';

class CounterController {
  final CounterModel _counterModel;
  final CounterModeModel _counterModeModel;

  CounterController(this._counterModel, this._counterModeModel);

  int get counter => _counterModel.counter;

  CounterMode get mode => _counterModeModel.counterMode;

  void execute() {
    switch (mode) {
      case CounterMode.plus:
        _counterModel.increment();
      case CounterMode.minus:
        _counterModel.decrement();
    }
  }

  void toggleMode() {
    _counterModeModel.toggle();
  }
}
