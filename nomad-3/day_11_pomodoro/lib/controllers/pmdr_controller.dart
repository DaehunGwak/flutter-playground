import 'dart:async';

import 'package:day_11_pomodoro/models/pmdr_minute_type.dart';
import 'package:day_11_pomodoro/models/pmdr_round_counter.dart';
import 'package:day_11_pomodoro/models/pmdr_timer.dart';

class PmdrController {
  final pmdrTimer = PmdrTimer();
  final roundCounter = PmdrRoundCounter();
  var _selectedMinuteType = PmdrMinuteType.twentyFive;

  PmdrMinuteType get selectedMinuteType => _selectedMinuteType;

  void selectMinute(PmdrMinuteType minuteType) {
    _selectedMinuteType = minuteType;
    pmdrTimer.initSeconds(minuteType);
  }

  void start() {
    pmdrTimer.play();
  }

  void tick(Timer timer) {
    if (pmdrTimer.isBreakFinished()) {
      pmdrTimer.reset(_selectedMinuteType);
      timer.cancel();
    }
    if (pmdrTimer.isFinished()) {
      pmdrTimer.onBreakMode();
      roundCounter.count();
      return;
    }
    pmdrTimer.count();
  }

  void pause() {
    pmdrTimer.pause();
  }
}
