import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayText extends StatelessWidget {
  static const _today = "TODAY";

  final DateTime dateTime;

  const DayText({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    if (_isToday()) {
      return Row(
        children: [
          const Text(
            _today,
            style: TextStyle(
              fontSize: Sizes.size46,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: Sizes.size8,
            height: Sizes.size8,
            margin: const EdgeInsets.only(left: Sizes.size8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink,
            ),
          )
        ],
      );
    }

    return Text(
      dateTime.day.toString(),
      style: const TextStyle(
        fontSize: Sizes.size46,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  bool _isToday() {
    final now = DateTime.now();
    return now.day == dateTime.day &&
        now.month == dateTime.month &&
        now.year == dateTime.year;
  }
}
