import 'package:flutter/material.dart';

class TimerCard extends StatelessWidget {
  final String time;

  const TimerCard({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Transform.translate(
            offset: const Offset(0, -45),
            child: Container(
              width: 150,
              height: 200,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
          ),
        ),
        Transform.scale(
          scale: 0.9,
          child: Transform.translate(
            offset: const Offset(0, -20),
            child: Container(
              width: 150,
              height: 200,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
          ),
        ),
        Container(
          width: 150,
          height: 200,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 82,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        )
      ],
    );
  }
}
