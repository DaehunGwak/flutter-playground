import 'package:flutter/material.dart';

class CardProgressPainter extends CustomPainter {
  CardProgressPainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(size.width, 0),
      Paint()
        ..color = Colors.black.withOpacity(0.1)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 25,
    );

    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(size.width * progress, 0),
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 25,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
