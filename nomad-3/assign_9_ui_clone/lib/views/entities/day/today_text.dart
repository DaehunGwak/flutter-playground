import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayText extends StatelessWidget {
  static final _weekFormat = DateFormat('EEEE');

  const TodayText({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Text(
      '${_weekFormat.format(today).toUpperCase()} ${today.day}',
      style: const TextStyle(
        fontSize: Sizes.size14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
