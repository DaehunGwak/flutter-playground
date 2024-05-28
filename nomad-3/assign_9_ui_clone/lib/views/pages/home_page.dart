import 'package:assign_9_ui_clone/views/widgets/days_selector_header.dart';
import 'package:assign_9_ui_clone/views/widgets/schedule_app_header.dart';
import 'package:assign_9_ui_clone/views/widgets/schedule_cards_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          clipBehavior: Clip.none,
          child: const Column(
            children: [
              ScheduleAppHeader(),
              DaysSelectorHeader(),
              ScheduleCardsBody(),
            ],
          ),
        ),
      ),
    );
  }
}
