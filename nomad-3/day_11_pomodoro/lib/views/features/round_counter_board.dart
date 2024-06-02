import 'package:day_11_pomodoro/models/pmdr_round_counter.dart';
import 'package:flutter/material.dart';

class RoundCounterBoard extends StatelessWidget {
  final int nowRound;
  final int nowGoal;

  const RoundCounterBoard({
    super.key,
    required this.nowRound,
    required this.nowGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildColumn(
            now: nowRound,
            max: PmdrRoundCounter.roundMax,
            text: "ROUND",
          ),
        ),
        Expanded(
          child: _buildColumn(
            now: nowGoal,
            max: PmdrRoundCounter.goalMax,
            text: "GOAL",
          ),
        ),
      ],
    );
  }

  Column _buildColumn({
    required int now,
    required int max,
    required String text,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$now/$max',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}
