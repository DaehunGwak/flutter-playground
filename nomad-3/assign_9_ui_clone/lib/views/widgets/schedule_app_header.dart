import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleAppHeader extends StatelessWidget {
  const ScheduleAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("image"),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
    );
  }
}
