import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/auth/views/widget/form_button.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  static const routeUrl = '/signup';
  static const routeName = 'signup';

  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Column(
        children: [
          const Spacer(flex: 2),
          _buildForm(),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Theme.of(context).colorScheme.onBackground,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: Sizes.size2,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size16,
                ),
              ),
            ),
            Gaps.v12,
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              cursorColor: Theme.of(context).colorScheme.onBackground,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: Sizes.size2,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size16,
                ),
              ),
            ),
            Gaps.v12,
            const FormButton(
              text: 'Sign up',
              disabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
