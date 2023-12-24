import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/auth/views/signup_screen.dart';
import 'package:thread_clone/auth/views/widget/form_button.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const routeUrl = '/login';
  static const routeName = 'login';

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLanguageText(context),
              const Spacer(flex: 2),
              _buildIcon(context),
              const Spacer(flex: 3),
              _buildForm(),
              const Spacer(flex: 5),
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageText(BuildContext context) {
    return Text(
      'English (US)',
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size8,
        horizontal: Sizes.size12,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: FaIcon(
        FontAwesomeIcons.threads,
        color: Theme.of(context).colorScheme.background,
        size: Sizes.size76,
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
              text: 'Log in',
              disabled: false,
            ),
            Gaps.v20,
            const Text(
              'Forgot password?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size14,
          ),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(SignUpScreen.routeName);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size8),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(Sizes.size4),
              ),
              child: const Text(
                'Create new Account',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        Gaps.v16,
        const FaIcon(
          FontAwesomeIcons.meta,
          color: Colors.grey,
        ),
      ],
    );
  }
}
