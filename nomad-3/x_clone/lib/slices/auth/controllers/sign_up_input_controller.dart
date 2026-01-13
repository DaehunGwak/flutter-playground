import 'package:flutter/material.dart';

import '../models/user_account.dart';

final signUpInputController = _SignUpInputController();

class _SignUpInputController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthController = TextEditingController();

  final UserAccount userAccount = UserAccount();


  _SignUpInputController() {
    nameController.addListener(() {
      userAccount.name = nameController.text;
    });
    emailController.addListener(() {
      userAccount.email = emailController.text;
    });
    birthController.addListener(() {
      userAccount.birthday = DateTime.parse(birthController.text);
    });
  }

  void addListeners({
    required VoidCallback nameListener,
    required VoidCallback emailListener,
    required VoidCallback birthListener,
  }) {
    nameController.addListener(nameListener);
    emailController.addListener(emailListener);
    birthController.addListener(birthListener);
  }

  void clearListener({
    required VoidCallback nameListener,
    required VoidCallback emailListener,
    required VoidCallback birthListener,
  }) {
    nameController.removeListener(nameListener);
    emailController.removeListener(emailListener);
    birthController.removeListener(birthListener);
  }
}
