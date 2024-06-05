import 'package:flutter/material.dart';

import '../../slices/auth/views/pages.dart';

abstract class AuthRoutes {
  static void pushAuthSignUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthSignUpPage(),
      ),
    );
  }

  static void pop(BuildContext context) {
    return Navigator.pop(context);
  }
}
