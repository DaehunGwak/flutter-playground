import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardScreen extends StatefulWidget {
  const FlipCardScreen({super.key});

  @override
  State<FlipCardScreen> createState() => _FlipCardScreenState();
}

class _FlipCardScreenState extends State<FlipCardScreen> {
  late final size = MediaQuery.of(context).size;
  bool _isBack = false;

  void _flipCard() {
    setState(() {
      _isBack = !_isBack;
    });
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotate = Tween(
      begin: pi,
      end: 0.0,
    ).animate(animation);

    return AnimatedBuilder(
      animation: animation,
      child: widget,
      builder: (_, widget) {
        final isBack = _isBack
            ? widget!.key == const ValueKey(false)
            : widget!.key != const ValueKey(false);

        final value = isBack ? min(rotate.value, pi / 2) : rotate.value;

        return Transform(
          transform: Matrix4.rotationY(value),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget buildCard(String text, bool isBack) {
    return Material(
      key: ValueKey<bool>(isBack),
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.5,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 36),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _isBack = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Card'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _flipCard,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            transitionBuilder: _transitionBuilder,
            layoutBuilder: (widget, list) {
              return Stack(
                children: [
                  if (widget != null) widget,
                  ...list,
                ],
              );
            },
            child: _isBack
                ? buildCard("answer", true)
                : buildCard("question", false),
          ),
        ),
      ),
    );
  }
}
