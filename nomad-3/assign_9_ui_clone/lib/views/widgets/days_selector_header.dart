import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DaysSelectorHeader extends StatelessWidget {
  const DaysSelectorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 32,
                itemBuilder: (BuildContext context, int index) {
                  return Text("$index");
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: Sizes.size8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
