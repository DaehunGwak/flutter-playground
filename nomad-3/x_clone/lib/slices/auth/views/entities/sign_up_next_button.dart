import 'package:flutter/material.dart';
import 'package:x_clone/slices/auth/controllers/sign_up_input_controller.dart';

class SignUpNextButton extends StatefulWidget {
  const SignUpNextButton({
    super.key,
  });

  @override
  State<SignUpNextButton> createState() => _SignUpNextButtonState();
}

class _SignUpNextButtonState extends State<SignUpNextButton> {
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
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          signUpInputController.userAccount.isValid()
              ? Colors.black
              : Colors.grey,
        ),
      ),
      child: const Text(
        'Next',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
