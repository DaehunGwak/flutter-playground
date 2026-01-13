import 'package:flutter/material.dart';

import '../../../../shared/ui.dart';
import '../entities.dart';
import '../widgets.dart';

class AuthSignUpPage extends StatelessWidget {
  const AuthSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AuthAppBarCancelButton(),
        leadingWidth: Sizes.size96,
        title: Logos.xTwitter,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: AuthSignUpLayout(),
        ),
      ),
    );
  }
}
