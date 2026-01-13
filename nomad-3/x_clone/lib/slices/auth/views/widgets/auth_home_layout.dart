import 'package:flutter/material.dart';

import '../../../../shared/routes/auth_routes.dart';
import '../../../../shared/ui.dart';
import '../entities.dart';

class AuthHomeLayout extends StatelessWidget {
  const AuthHomeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Align(
            alignment: Alignment.center,
            child: AuthTitleText(
                title: 'See whats\'s happening in the world right now.'),
          ),
        ),
        const AuthWayButton(text: 'Continue with Google', icon: Logos.google),
        Gaps.v14,
        const AuthWayButton(text: 'Continue with Apple', icon: Logos.apple),
        Gaps.v20,
        const Row(
          children: [
            Expanded(
              child: Divider(color: Colors.grey),
            ),
            Gaps.h10,
            Text('or'),
            Gaps.h10,
            Expanded(
              child: Divider(color: Colors.grey),
            ),
          ],
        ),
        Gaps.v5,
        GestureDetector(
          onTap: () => AuthRoutes.pushAuthSignUpPage(context),
          child: AuthWayButton(
            text: 'Create account',
            backgroundColor: Theme.of(context).colorScheme.primary,
            fontColor: Theme.of(context).colorScheme.onPrimary,
            borderColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        Gaps.v20,
        const AuthSimpleAgreementsText(),
        Gaps.v40,
        const AuthLoginGuideText(),
        Gaps.v20,
      ],
    );
  }
}
