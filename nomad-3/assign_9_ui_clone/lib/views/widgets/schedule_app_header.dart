import 'package:assign_9_ui_clone/views/features/profile/profile_image.dart';
import 'package:assign_9_ui_clone/views/features/schedule/schedule_add_button.dart';
import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleAppHeader extends StatelessWidget {
  const ScheduleAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: Sizes.size12,
        right: Sizes.size4,
        bottom: Sizes.size6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImage(),
          ScheduleAddButton(),
        ],
      ),
    );
  }
}
