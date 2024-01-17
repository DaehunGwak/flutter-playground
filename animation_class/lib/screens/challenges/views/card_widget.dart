import 'dart:math';

import 'package:animation_class/screens/challenges/models/card_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.model,
    this.isBack = false,
  });

  final CardModel model;
  final bool isBack;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late bool _isBack;

  void _flipCard() {
    debugPrint("flipCard: $_isBack");
    setState(() {
      _isBack = !_isBack;
    });
  }

  @override
  void initState() {
    super.initState();
    _isBack = widget.isBack;
    debugPrint("init: $_isBack, ${widget.isBack}");
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
            ? widget!.key == ValueKey("${super.widget.key}-${false}")
            : widget!.key != ValueKey("${super.widget.key}-${false}");

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
    final size = MediaQuery.of(context).size;

    return Material(
      key: ValueKey("${widget.key}-$isBack"),
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
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
            ? buildCard(widget.model.answer, true)
            : buildCard(widget.model.question, false),
      ),
    );
  }
}
