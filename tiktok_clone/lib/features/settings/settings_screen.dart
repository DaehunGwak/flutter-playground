import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = await showDateRangePicker(
                context: context,
                initialDateRange: DateTimeRange(
                  start: DateTime.now(),
                  end: DateTime.now().add(Duration(days: 1)),
                ),
                firstDate: DateTime(2010),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    child: child!,
                    data: ThemeData(
                      appBarTheme: AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  );
                },
              );
              print(booking);
            },
            title: const Text('What is your birthday?'),
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
