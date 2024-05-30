import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlay;
  final void Function() onPause;
  final void Function() onStart;

  const PlayPauseButton({
    super.key,
    required this.isPlay,
    required this.onPause,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.bottomCenter,
      child: isPlay
          ? IconButton(
              onPressed: onPause,
              icon: const Icon(
                Icons.pause_circle,
                size: 150,
                color: Colors.white,
              ),
            )
          : IconButton(
              onPressed: onStart,
              icon: const Icon(
                Icons.play_circle_outline,
                size: 150,
                color: Colors.white,
              ),
            ),
    );
  }
}
