import 'package:assign_9_ui_clone/models/schedule.dart';
import 'package:assign_9_ui_clone/views/features/schedule/schedule_card.dart';
import 'package:flutter/material.dart';

class ScheduleCardsBody extends StatefulWidget {
  const ScheduleCardsBody({super.key});

  @override
  State<ScheduleCardsBody> createState() => _ScheduleCardsBodyState();
}

class _ScheduleCardsBodyState extends State<ScheduleCardsBody> {
  late final List<Schedule> _schedules;
  late final List<Color> _cardColors;

  @override
  void initState() {
    super.initState();
    _schedules = [
      Schedule(
        title: "Design Meeting",
        startDateTime: DateTime(2024, 5, 28, 11, 30),
        endDateTime: DateTime(2024, 5, 28, 12, 20),
        participants: ["ALEX", "HELENA", "NANA"],
      ),
      Schedule(
        title: "Daily Project",
        startDateTime: DateTime(2024, 5, 28, 12, 35),
        endDateTime: DateTime(2024, 5, 28, 14, 10),
        participants: ["ME", "RICHARD", "CIRY", "HELENA", "NANA", "DEN", "DANA"],
      ),
      Schedule(
        title: "Weekly Planning",
        startDateTime: DateTime(2024, 5, 28, 15, 00),
        endDateTime: DateTime(2024, 5, 28, 16, 30),
        participants: ["DEN", "DANA", "MARK"],
      ),
    ];
    _cardColors = [
      const Color.fromRGBO(254, 246, 84, 1),
      const Color.fromRGBO(157, 107, 206, 1),
      const Color.fromRGBO(187, 239, 75, 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: _schedules.length,
        itemBuilder: (BuildContext context, int index) {
          return ScheduleCard(
            schedule: _schedules[index],
            color: _cardColors[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox.fromSize(
            size: const Size.fromHeight(2.0),
          );
        },
      ),
    );
  }
}
