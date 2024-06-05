import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../shared/ui.dart';

class AuthWayButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;

  const AuthWayButton({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor = Colors.white,
    this.fontColor = Colors.black,
    this.borderColor = Colors.black12,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox( // 부모 크기에 맞춰 사이즈 지정 가능
      widthFactor: 1.0,
      child: Container(
        padding: const EdgeInsets.all(Sizes.size16),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: Sizes.size2,
          ),
          borderRadius: BorderRadius.circular(Sizes.size64),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) Gaps.h10,
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w800,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
