import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleTimeText extends StatelessWidget {
  static final _timeFormat = NumberFormat('00');

  final DateTime dateTime;

  const ScheduleTimeText({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _timeFormat.format(dateTime.hour),
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.surface,
            height: 1.1,
          ),
        ),
        Text(
          _timeFormat.format(dateTime.minute),
          style: TextStyle(
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.surface,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
