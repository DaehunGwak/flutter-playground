import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({super.key});

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..forward();

  late final CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.bounceOut,
  );

  late Animation<double> _progressAnimation = Tween(
    begin: 0.001,
    end: 1.5,
  ).animate(_curvedAnimation);

  void _animateValues() {
    setState(() {
      _progressAnimation = Tween(
        begin: _progressAnimation.value,
        end: Random().nextDouble() * 2.0,
      ).animate(_curvedAnimation);
    });
    _animationController
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _curvedAnimation.dispose();
    _animationController.dispose();
    super.dispose();
  }

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
        child: AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return CustomPaint(
              painter: AppleWatchPainter(
                progress: _progressAnimation.value,
              ),
              size: const Size(400, 400),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateValues,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  AppleWatchPainter({
    required this.progress,
  });

  static const startAngle = -0.5 * pi;
  static const strokeWidth = 25.0;

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final centerOffset = Offset(size.width / 2, size.height / 2);

    // draw red
    final redRadius = (size.width / 2) * 0.9;
    _drawCircle(canvas, centerOffset, redRadius, Colors.red);
    _drawArc(canvas, centerOffset, redRadius, Colors.red);

    // draw green
    final greenRadius = (size.width / 2) * 0.76;
    _drawCircle(canvas, centerOffset, greenRadius, Colors.green);
    _drawArc(canvas, centerOffset, greenRadius, Colors.green);

    // draw blue
    final blueRadius = (size.width / 2) * 0.62;
    _drawCircle(canvas, centerOffset, blueRadius, Colors.blue);
    _drawArc(canvas, centerOffset, blueRadius, Colors.blue);
  }

  void _drawCircle(
    Canvas canvas,
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
      startAngle,
      progress * pi,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AppleWatchPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
