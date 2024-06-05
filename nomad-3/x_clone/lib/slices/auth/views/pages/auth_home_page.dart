import 'package:flutter/material.dart';

import '../../../../shared/ui.dart';
import '../widgets.dart';

class AuthHomePage extends StatelessWidget {
  const AuthHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Logos.xTwitter,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size52),
          child: AuthHomeLayout(),
        ),
      ),
    );
  }
}
