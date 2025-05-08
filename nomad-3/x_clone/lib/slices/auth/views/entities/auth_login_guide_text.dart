import 'package:flutter/material.dart';

import '../../../../shared/ui.dart';

class AuthLoginGuideText extends StatelessWidget {
  const AuthLoginGuideText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Have an account already? ',
        style: TextStyle(
          color: Colors.black87,
          fontSize: Sizes.size14,
        ),
        children: [
          TextSpan(
            text: 'Log in',
            style:
            TextStyle(fontSize: Sizes.size14, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
