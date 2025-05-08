import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double radius;

  const RoundedContainer({
    required this.child,
    this.radius = 10,
    this.padding,
    this.margin,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
