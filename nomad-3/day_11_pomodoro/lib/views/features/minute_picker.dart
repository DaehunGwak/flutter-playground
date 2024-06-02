import 'package:day_11_pomodoro/models/pmdr_minute_type.dart';
import 'package:flutter/material.dart';

class MinutePicker extends StatefulWidget {
  final PmdrMinuteType selectedMinuteType;
  final void Function(PmdrMinuteType) onSelectMinute;

  const MinutePicker({
    super.key,
    required this.selectedMinuteType,
    required this.onSelectMinute,
  });

  @override
  State<MinutePicker> createState() => _MinutePickerState();
}

class _MinutePickerState extends State<MinutePicker> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 180);

  void _selectMinuteButton(PmdrMinuteType minuteType, int index) {
    widget.onSelectMinute(minuteType);
    _scrollController.animateTo(
      0 + index * 90,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(0.0),
              Theme.of(context).colorScheme.surface.withOpacity(0.0),
              Theme.of(context).colorScheme.surface.withOpacity(0.0),
              Theme.of(context).colorScheme.surface,
            ]),
      ),
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 170),
          for (var i = 0; i < PmdrMinuteType.values.length; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 56, 5, 4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: widget.selectedMinuteType == PmdrMinuteType.values[i]
                      ? Colors.white
                      : Colors.transparent,
                  border: Border.all(
                    color: Colors.white54,
                    width: 3,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
                child: TextButton(
                  onPressed: () {
                    _selectMinuteButton(PmdrMinuteType.values[i], i);
                  },
                  child: Text(
                    "${PmdrMinuteType.values[i].minutes}",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color:
                          widget.selectedMinuteType == PmdrMinuteType.values[i]
                              ? Theme.of(context).colorScheme.surface
                              : Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(width: 170),
        ],
      ),
    );
  }
}
