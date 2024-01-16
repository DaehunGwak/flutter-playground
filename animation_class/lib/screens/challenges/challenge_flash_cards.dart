import 'dart:math';

import 'package:animation_class/screens/challenges/models/card_model.dart';
import 'package:animation_class/screens/challenges/views/card_progress_painter.dart';
import 'package:animation_class/screens/challenges/views/card_widget.dart';
import 'package:flutter/material.dart';

class FlashCardsAppScreen extends StatefulWidget {
  const FlashCardsAppScreen({super.key});

  @override
  State<FlashCardsAppScreen> createState() => _FlashCardsAppScreenState();
}

class _FlashCardsAppScreenState extends State<FlashCardsAppScreen>
    with TickerProviderStateMixin {
  late final size = MediaQuery.of(context).size;

  late final AnimationController _positionController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
    upperBound: size.width + 100,
    lowerBound: -(size.width + 100),
    value: 0,
  );

  late final AnimationController _progressController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Tween<double> _rotationTween = Tween(
    begin: -15,
    end: 15,
  );

  late final Tween<double> _scaleTween = Tween(
    begin: 0.8,
    end: 1,
  );

  late final ColorTween _blueToRedTween = ColorTween(
    begin: Colors.lightBlueAccent,
    end: Colors.deepOrangeAccent,
  );
  late final ColorTween _blueToGreenTween = ColorTween(
    begin: Colors.lightBlueAccent,
    end: Colors.greenAccent,
  );

  static final _cardModels = CardModelFactory.create();
  static final _cardLimit = _cardModels.length;
  int _index = 0;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _positionController.value += details.delta.dx;
  }

  Future<void> _onHorizontalDragEnd(DragEndDetails details) async {
    final bound = size.width - 150;
    final dropPosition = size.width + 100;

    if (_positionController.value.abs() >= bound) {
      await _positionController.animateTo(
        (_positionController.value > 0) ? dropPosition : -dropPosition,
      );
      setState(() {
        _positionController.value = 0;
        _index++;
      });
      _progressController.animateTo(
        _index / _cardLimit,
        curve: Curves.easeOut,
      );
    } else {
      await _positionController.animateTo(
        0,
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _positionController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _positionController,
          builder: (context, child) {
            final color = (_positionController.value < 0)
                ? _blueToRedTween.transform(
                    _positionController.value.abs() / size.width * 2,
                  )
                : _blueToGreenTween.transform(
                    _positionController.value.abs() / size.width * 2,
                  );
            final angle = _rotationTween.transform(
              (_positionController.value + size.width / 2) / size.width,
            );
            final scale = _scaleTween.transform(
              _positionController.value.abs() / size.width,
            );

            return Scaffold(
              backgroundColor: color,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                title: const Text('Flash Cards'),
              ),
              body: Stack(
                children: [
                  const Center(
                    child: Text(
                      'done!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  if (_index + 1 < _cardLimit)
                    Center(
                      child: GestureDetector(
                        child: Transform.scale(
                          scale: min(scale, 1.0),
                          child: CardWidget(
                            model: _cardModels.elementAt(_index + 1),
                          ),
                        ),
                      ),
                    ),
                  if (_index < _cardLimit)
                    Center(
                      child: GestureDetector(
                        onHorizontalDragUpdate: _onHorizontalDragUpdate,
                        onHorizontalDragEnd: _onHorizontalDragEnd,
                        child: Transform.translate(
                          offset: Offset(_positionController.value, 0),
                          child: Transform.rotate(
                            angle: angle * pi / 180,
                            child: CardWidget(
                              model: _cardModels.elementAt(_index),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    left: size.width * 0.1,
                    bottom: 100,
                    child: AnimatedBuilder(
                      animation: _progressController,
                      builder: (context, child) => SizedBox(
                        width: size.width * 0.8,
                        child: CustomPaint(
                          painter: CardProgressPainter(
                            progress: _progressController.value,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
