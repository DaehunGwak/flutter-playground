import 'dart:async';

import 'package:day_11_pomodoro/controllers/pmdr_controller.dart';
import 'package:day_11_pomodoro/models/pmdr_minute_type.dart';
import 'package:day_11_pomodoro/views/features/minute_picker.dart';
import 'package:day_11_pomodoro/views/features/minute_second_cards.dart';
import 'package:day_11_pomodoro/views/features/play_pause_button.dart';
import 'package:day_11_pomodoro/views/features/round_counter_board.dart';
import 'package:flutter/material.dart';

class TimerBody extends StatefulWidget {
  const TimerBody({super.key});

  @override
  State<TimerBody> createState() => _TimerBodyState();
}

class _TimerBodyState extends State<TimerBody> {
  final _pmdrController = PmdrController();
  late Timer _timer;

  void _selectMinuteType(PmdrMinuteType minuteType) {
    setState(() {
      _pmdrController.selectMinute(minuteType);
    });
  }

  void _onStart() {
    setState(() {
      _timer = Timer.periodic(const Duration(milliseconds: 5), _tick);
      _pmdrController.start();
    });
  }

  void _tick(Timer timer) {
    setState(() {
      _pmdrController.tick(timer);
    });
  }

  void _onPause() {
    setState(() {
      _pmdrController.pause();
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //// timer view ////////////
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: MinuteSecondCards(
            isFocus: _pmdrController.pmdrTimer.isFocus,
            minutes: _pmdrController.pmdrTimer.nowFormatMinutes,
            seconds: _pmdrController.pmdrTimer.nowFormatSeconds,
          ),
        ),
        //// minute picker /////////
        Flexible(
          flex: 2,
          child: MinutePicker(
            selectedMinuteType: _pmdrController.selectedMinuteType,
            onSelectMinute: _selectMinuteType,
          ),
        ),
        Flexible(
          flex: 4,
          child: PlayPauseButton(
            isPlay: _pmdrController.pmdrTimer.isPlay,
            onPause: _onPause,
            onStart: _onStart,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: RoundCounterBoard(
              nowRound: _pmdrController.roundCounter.nowRound,
              nowGoal: _pmdrController.roundCounter.nowGoal,
            ),
          ),
        ),
      ],
    );
  }
}
