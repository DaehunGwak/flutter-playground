import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({super.key});

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Apple Watch'),
      ),
      body: Center(
        child: CustomPaint(
          painter: AppleWatchPainter(),
          size: const Size(400, 400),
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerOffset = Offset(size.width / 2, size.height / 2);
    const strokeWidth = 25.0;

    // draw red
    final redRadius = (size.width / 2) * 0.9;
    _drawCircle(canvas, strokeWidth, centerOffset, redRadius, Colors.red);
    _drawArc(canvas, strokeWidth, centerOffset, redRadius, Colors.red);

    // draw green
    final greenRadius = (size.width / 2) * 0.76;
    _drawCircle(canvas, strokeWidth, centerOffset, greenRadius, Colors.green);
    _drawArc(canvas, strokeWidth, centerOffset, greenRadius, Colors.green);

    // draw blue
    final blueRadius = (size.width / 2) * 0.62;
    _drawCircle(canvas, strokeWidth, centerOffset, blueRadius, Colors.blue);
    _drawArc(canvas, strokeWidth, centerOffset, blueRadius, Colors.blue);
  }

  void _drawCircle(
    Canvas canvas,
    double strokeWidth,
    Offset centerOffset,
    double radius,
    MaterialColor color,
  ) {
    final circlePaint = Paint()
      ..color = color.shade400.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(
      centerOffset,
      radius,
      circlePaint,
    );
  }

  void _drawArc(
    Canvas canvas,
    double strokeWidth,
    Offset centerOffset,
    double radius,
    MaterialColor color,
  ) {
    final arcRect = Rect.fromCircle(
      center: centerOffset,
      radius: radius,
    );
    final arcPaint = Paint()
      ..color = color.shade400
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
