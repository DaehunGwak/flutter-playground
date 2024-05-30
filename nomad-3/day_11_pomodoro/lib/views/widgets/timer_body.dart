import 'dart:async';

import 'package:day_11_pomodoro/controllers/pmdr_controller.dart';
import 'package:day_11_pomodoro/models/pmdr_minute_type.dart';
import 'package:day_11_pomodoro/views/features/round_counter_board.dart';
import 'package:day_11_pomodoro/views/entities/timer_card.dart';
import 'package:flutter/material.dart';

class TimerBody extends StatefulWidget {
  const TimerBody({super.key});

  @override
  State<TimerBody> createState() => _TimerBodyState();
}

class _TimerBodyState extends State<TimerBody> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 180);
  final _pmdrController = PmdrController();
  late Timer _timer;

  void _selectMinuteButton(PmdrMinuteType minuteType, int index) {
    setState(() {
      _pmdrController.selectMinute(minuteType);
    });
    _scrollController.animateTo(
      0 + index * 90,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
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
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _pmdrController.pmdrTimer.isFocus
                    ? const Text('')
                    : const Text(
                        'break time',
                        style: TextStyle(
                          fontSize: 32,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TimerCard(time: _pmdrController.pmdrTimer.nowFormatMinutes),
                    const Text(
                      ' : ',
                      style: TextStyle(
                        fontSize: 82,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -8,
                      ),
                    ),
                    TimerCard(time: _pmdrController.pmdrTimer.nowFormatSeconds),
                  ],
                ),
              ],
            ),
          ),
        ),
        //// minute picker /////////
        Flexible(
          flex: 2,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.surface.withOpacity(0.0),
                    Theme.of(context).colorScheme.surface.withOpacity(0.0),
                    Theme.of(context).colorScheme.surface.withOpacity(0.0),
                    Theme.of(context).colorScheme.surface,
                  ]),
            ),
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 170),
                for (var i = 0; i < PmdrMinuteType.values.length; i++)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 56, 5, 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: _pmdrController.selectedMinuteType ==
                                PmdrMinuteType.values[i]
                            ? Colors.white
                            : Colors.transparent,
                        border: Border.all(
                          color: Colors.white54,
                          width: 3,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _selectMinuteButton(PmdrMinuteType.values[i], i);
                        },
                        child: Text(
                          "${PmdrMinuteType.values[i].minutes}",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: _pmdrController.selectedMinuteType ==
                                    PmdrMinuteType.values[i]
                                ? Theme.of(context).colorScheme.surface
                                : Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 170),
              ],
            ),
          ),
        ),
        //// play & pause button ///
        Flexible(
          flex: 4,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            alignment: Alignment.bottomCenter,
            child: _pmdrController.pmdrTimer.isPlay
                ? IconButton(
                    onPressed: _onPause,
                    icon: const Icon(
                      Icons.pause_circle,
                      size: 150,
                      color: Colors.white,
                    ),
                  )
                : IconButton(
                    onPressed: _onStart,
                    icon: const Icon(
                      Icons.play_circle_outline,
                      size: 150,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        //// bottom board //////////
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
