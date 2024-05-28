import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:assign_9_ui_clone/views/widgets/days_selector_header.dart';
import 'package:assign_9_ui_clone/views/widgets/schedule_app_header.dart';
import 'package:assign_9_ui_clone/views/widgets/schedule_cards_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
          child: Column(
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
