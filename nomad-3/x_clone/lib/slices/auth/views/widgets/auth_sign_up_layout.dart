import 'package:flutter/material.dart';
import 'package:x_clone/slices/auth/controllers/sign_up_input_controller.dart';

import '../../../../shared/ui.dart';
import '../entities.dart';
import '../features.dart';

class AuthSignUpLayout extends StatefulWidget {
  const AuthSignUpLayout({super.key});

  @override
  State<AuthSignUpLayout> createState() => _AuthSignUpLayoutState();
}

class _AuthSignUpLayoutState extends State<AuthSignUpLayout> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v24,
                AuthTitleText(title: 'Create your account'),
                Gaps.v24,
                SignUpInputForm(),
                Gaps.v10,
              ],
            ),
          ),
        ),
        SignUpNextButton(),
      ],
    );
  }
}
