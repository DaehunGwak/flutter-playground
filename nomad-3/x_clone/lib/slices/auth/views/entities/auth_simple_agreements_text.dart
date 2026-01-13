import 'package:flutter/material.dart';

import '../../../../shared/ui.dart';

class AuthSimpleAgreementsText extends StatelessWidget {
  const AuthSimpleAgreementsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
          text: 'By signing up, you agree to our ',
          style:
          TextStyle(color: Colors.black87, fontSize: Sizes.size16),
          children: [
            TextSpan(
              text: 'Terms',
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Colors.black87),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(
              text: ', and ',
              style: TextStyle(color: Colors.black87),
            ),
            TextSpan(
              text: 'Cookie Use',
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(
              text: '.',
              style: TextStyle(color: Colors.black87),
            ),
          ]),
    );
  }
}
