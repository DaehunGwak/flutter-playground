import 'package:flutter/material.dart';

class ScheduleCardsBody extends StatelessWidget {
  const ScheduleCardsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 60,
        itemBuilder: (BuildContext context, int index) {
          return Text("test $index", style: TextStyle(color: Colors.white),);
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
