import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/ui.dart';

class SignUpBirthFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintName;
  final bool isValid;

  const SignUpBirthFormField({
    super.key,
    required this.controller,
    required this.hintName,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (controller.text.isNotEmpty) Text(hintName),
        if (controller.text.isEmpty) Gaps.v20,
        GestureDetector(
          onTap: () => _showDialog(
            context,
            CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (newDate) {
                final month = newDate.month.toString().padLeft(2, '0');
                final day = newDate.day.toString().padLeft(2, '0');
                controller.text = '${newDate.year}-$month-$day';
              },
            ),
          ),
          child: TextFormField(
            enabled: false,
            controller: controller,
            style: TextStyle(
              color: isValid ? Colors.blueAccent : Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hintName,
              hintStyle: const TextStyle(
                color: Colors.black54,
              ),
              suffixIcon: const Icon(Icons.check_circle),
              suffixIconColor: isValid ? Colors.green : Colors.transparent,
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        Gaps.v8,
        if (controller.text.isNotEmpty)
          const Text(
            'This will not be shown publicly, Confirm your own age, even if this account is for a business, a pet, or something else',
          ),
      ],
    );
  }

  void _showDialog(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => Container(
        height: 260,
        padding: const EdgeInsets.only(top: Sizes.size6),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: const Border(
            top: BorderSide(width: 0.2, color: Colors.black54),
          ),
        ),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
