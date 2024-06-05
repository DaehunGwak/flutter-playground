import 'package:flutter/material.dart';

import '../../../../shared/routes/auth_routes.dart';
import '../../../../shared/ui.dart';

class AuthAppBarCancelButton extends StatelessWidget {
  const AuthAppBarCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => AuthRoutes.pop(context),
      child: const Text(
        'Cancel',
        softWrap: false,
        style: TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
