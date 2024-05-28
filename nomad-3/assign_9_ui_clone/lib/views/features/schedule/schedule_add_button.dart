import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/material.dart';

class ScheduleAddButton extends StatelessWidget {
  const ScheduleAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      iconSize: Sizes.size46,
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.add),
    );
  }
}
