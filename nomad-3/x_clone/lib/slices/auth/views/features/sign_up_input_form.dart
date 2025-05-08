import 'package:flutter/material.dart';

import '../../../../shared/ui.dart';
import '../../controllers/sign_up_input_controller.dart';
import '../entities.dart';

class SignUpInputForm extends StatefulWidget {
  const SignUpInputForm({super.key});

  @override
  State<SignUpInputForm> createState() => _SignUpInputFormState();
}

class _SignUpInputFormState extends State<SignUpInputForm> {
  @override
  void initState() {
    super.initState();
    signUpInputController.addListeners(
      nameListener: _reRender,
      emailListener: _reRender,
      birthListener: _reRender,
    );
  }

  @override
  void dispose() {
    super.dispose();
    signUpInputController.clearListener(
      nameListener: _reRender,
      emailListener: _reRender,
      birthListener: _reRender,
    );
  }

  void _reRender() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SignUpTextFormField(
            controller: signUpInputController.nameController,
            hintName: 'Name',
            isValid: signUpInputController.userAccount.isNameValid(),
          ),
          Gaps.v20,
          SignUpTextFormField(
            controller: signUpInputController.emailController,
            hintName: 'Email',
            isValid: signUpInputController.userAccount.isEmailValid(),
          ),
          Gaps.v20,
          SignUpBirthFormField(
            controller: signUpInputController.birthController,
            hintName: 'Date of birth',
            isValid: signUpInputController.userAccount.isBirthdayValid(),
          ),
        ],
      ),
    );
  }
}
