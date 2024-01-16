import 'dart:math';

import 'package:flutter/material.dart';

class SwipingCardsScreen extends StatefulWidget {
  const SwipingCardsScreen({super.key});

  @override
  State<SwipingCardsScreen> createState() => _SwipingCardsScreenState();
}

class _SwipingCardsScreenState extends State<SwipingCardsScreen>
    with SingleTickerProviderStateMixin {
  late final size = MediaQuery.of(context).size;

  late final AnimationController _positionController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
    upperBound: size.width,
    lowerBound: -size.width,
    value: 0,
  );

  late final Tween<double> _rotationTween = Tween(
    begin: -15,
    end: 15,
  );

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _positionController.value += details.delta.dx;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    _positionController.animateTo(
      0,
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swiping Cards'),
      ),
      body: AnimatedBuilder(
        animation: _positionController,
        builder: (context, child) {
          final angle = _rotationTween.transform(
            (_positionController.value + size.width / 2) / size.width,
          );
          return Stack(
            children: [
              Center(
                child: GestureDetector(
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  onHorizontalDragEnd: _onHorizontalDragEnd,
                  child: Transform.translate(
                    offset: Offset(_positionController.value, 0),
                    child: Transform.rotate(
                      angle: angle * pi / 180,
                      child: Material(
                        elevation: 10,
                        color: Colors.red.shade100,
                        child: SizedBox(
                          width: size.width * 0.8,
                          height: size.height * 0.5,
                          child: const Center(
                            child: Text("Front"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
