import 'package:assign_9_ui_clone/models/schedule.dart';
import 'package:assign_9_ui_clone/views/entities/schedule/schedule_participant_text.dart';
import 'package:assign_9_ui_clone/views/entities/schedule/schedule_time_text.dart';
import 'package:assign_9_ui_clone/views/entities/schedule/schedule_title_text.dart';
import 'package:assign_9_ui_clone/views/shared/gaps.dart';
import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule schedule;
  final Color color;

  const ScheduleCard({
    super.key,
    required this.schedule,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: Sizes.size24,
        top: Sizes.size32,
        bottom: Sizes.size24,
        right: Sizes.size16,
      ),
      margin: const EdgeInsets.all(Sizes.size8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size46),
        color: color,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ScheduleTimeText(dateTime: schedule.startDateTime),
                  const SizedBox(
                    height: Sizes.size36,
                    child: VerticalDivider(
                      width: 2,
                      thickness: 1.2,
                      indent: Sizes.size4,
                      endIndent: Sizes.size4,
                    ),
                  ),
                  ScheduleTimeText(dateTime: schedule.endDateTime),
                ],
              ),
              Gaps.w12,
              ScheduleTitleText(text: schedule.title),
            ],
          ),
          Gaps.h24,
          Row(
            children: [
              Gaps.w40,
              for (var name in schedule.participants.getRange(0, 3)) ...[
                ScheduleParticipantText(name: name),
                Gaps.w24,
              ],
              if (schedule.participants.length > 4)
                ScheduleParticipantText(
                  name: '+${schedule.participants.length - 3}',
                ),
            ],
          ),
        ],
      ),
    );
  }
}
