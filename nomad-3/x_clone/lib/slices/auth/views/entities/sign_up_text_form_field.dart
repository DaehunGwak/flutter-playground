import 'package:flutter/material.dart';

import '../../../../shared/ui.dart';

class SignUpTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintName;
  final bool isValid;

  const SignUpTextFormField({
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
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintName,
            suffixIcon: const Icon(Icons.check_circle),
            suffixIconColor: isValid ? Colors.green : Colors.transparent,
          ),
          style: TextStyle(
            color: isValid ? Colors.blueAccent : Colors.black,
          ),
        ),
      ],
    );
  }
}
