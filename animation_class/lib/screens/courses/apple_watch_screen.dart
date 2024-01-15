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
          size: const Size(300, 300),
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(
      0,
      0,
      size.width,
      size.height,
    );
    final paint = Paint()..color = Colors.blueAccent;

    canvas.drawRect(
      rect,
      paint,
    );

    canvas.drawCircle(
      Offset(
        size.width / 2,
        size.height / 2,
      ),
      size.width / 2 - 10,
      Paint()
        ..color = Colors.greenAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 20,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
