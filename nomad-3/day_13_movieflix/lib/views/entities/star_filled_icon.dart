import 'dart:math';

import 'package:flutter/material.dart';

class StarFilledIcon extends StatelessWidget {
  const StarFilledIcon({
    super.key,
    required this.ratio,
  });

  final double ratio;

  @override
  Widget build(BuildContext context) {
    final realRatio = _realRatio();
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (rect) {
        return LinearGradient(
          stops: [0, realRatio, realRatio],
          colors: [Colors.yellow, Colors.yellow, Colors.yellow.withOpacity(0)],
        ).createShader(rect);
      },
      child: const Icon(Icons.star, color: Colors.white),
    );
  }

  double _realRatio() => min(1.0, ratio);
}
