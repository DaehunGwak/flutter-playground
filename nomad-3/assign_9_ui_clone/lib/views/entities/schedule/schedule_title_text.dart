import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/material.dart';

class ScheduleTitleText extends StatelessWidget {
  final String text;

  const ScheduleTitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: Sizes.size60,
          fontWeight: FontWeight.w500,
          height: 0.9,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
