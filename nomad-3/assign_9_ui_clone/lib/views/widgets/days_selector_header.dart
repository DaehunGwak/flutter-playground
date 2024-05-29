import 'package:assign_9_ui_clone/views/entities/day/day_text.dart';
import 'package:assign_9_ui_clone/views/entities/day/today_text.dart';
import 'package:assign_9_ui_clone/views/shared/gaps.dart';
import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DaysSelectorHeader extends StatefulWidget {
  const DaysSelectorHeader({super.key});

  @override
  State<DaysSelectorHeader> createState() => _DaysSelectorHeaderState();
}

class _DaysSelectorHeaderState extends State<DaysSelectorHeader> {
  late final List<DateTime?> days;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    days = [
      null,
      ...List.generate(30, (int i) => now.add(Duration(days: i))),
      null,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: Sizes.size16,
            top: Sizes.size16,
          ),
          child: TodayText(),
        ),
        Container(
          height: Sizes.size64,
          margin: const EdgeInsets.only(
            bottom: Sizes.size24,
          ),
          clipBehavior: Clip.none,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (days[index] == null) {
                      return Gaps.w4;
                    }
                    return DayText(dateTime: days[index]!);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gaps.w12;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
