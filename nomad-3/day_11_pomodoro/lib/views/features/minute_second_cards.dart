import 'package:day_11_pomodoro/views/entities/timer_card.dart';
import 'package:flutter/material.dart';

class MinuteSecondCards extends StatelessWidget {
  final bool isFocus;
  final String minutes;
  final String seconds;

  const MinuteSecondCards({
    super.key,
    required this.isFocus,
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          isFocus
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
              TimerCard(time: minutes),
              const Text(
                ' : ',
                style: TextStyle(
                  fontSize: 82,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -8,
                ),
              ),
              TimerCard(time: seconds),
            ],
          ),
        ],
      ),
    );
  }
}
