import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/material.dart';

class ScheduleParticipantText extends StatelessWidget {
  final String name;

  const ScheduleParticipantText({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: Sizes.size16,
        fontWeight: FontWeight.w500,
        color: name == 'ME'
            ? Theme.of(context).colorScheme.surface
            : const Color.fromRGBO(32, 32, 32, 0.5),
      ),
    );
  }
}
