import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.text,
    required bool disabled,
  }) : _disabled = disabled;

  final String text;
  final bool _disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // NEW
      widthFactor: 1,
      child: AnimatedContainer(
        // NEW
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
        decoration: BoxDecoration(
          color: _disabled ? Colors.grey.shade100 : Colors.blueAccent,
          borderRadius: BorderRadius.circular(Sizes.size5),
        ),
        duration: const Duration(milliseconds: 300),
        child: AnimatedDefaultTextStyle(
          // NEW
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: _disabled ? Colors.grey : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: Sizes.size16,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
