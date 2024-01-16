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
    upperBound: size.width + 100,
    lowerBound: -(size.width + 100),
    value: 0,
  );

  late final Tween<double> _rotationTween = Tween(
    begin: -15,
    end: 15,
  );

  late final Tween<double> _scaleTween = Tween(
    begin: 0.8,
    end: 1,
  );

  final _cardLimit = 5;
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
    super.dispose();
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
          final scale = _scaleTween.transform(
            _positionController.value.abs() / size.width,
          );

          return Stack(
            children: [
              const Center(
                child: Text('done!'),
              ),
              if (_index + 1 < _cardLimit)
                Center(
                  child: GestureDetector(
                    child: Transform.scale(
                      scale: min(scale, 1.0),
                      child: CardWidget(text: "Front ${_index + 1}"),
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
                        child: CardWidget(text: "Front $_index"),
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

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.5,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
