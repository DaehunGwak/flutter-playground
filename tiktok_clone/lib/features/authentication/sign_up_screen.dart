import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/log_in_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/view_models/social_auth_view_model.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  static const routeName = 'signUp';
  static const routeUrl = '/signup';

  _onLoginTap(BuildContext context) {
    context.push(LogInScreen.routeUrl);
  }

  _onEmailTap(BuildContext context) {
    context.pushNamed(UsernameScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        // os 에서 기본적으로 상위 가려지는 구간 레이어를 비켜 내려갈 수 있음
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v80,
              const Text(
                'Sign up for TikTok',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                'Create a profile, follow other accounts, make your own vidoes, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                // TODO: 해당 제스쳐 디텍터를 AuthButton 에 내재화 시키기
                onTap: () => _onEmailTap(context),
                child: const AuthButton(
                  text: 'Use email & password',
                  icon: FaIcon(FontAwesomeIcons.user),
                ),
              ),
              Gaps.v12,
              GestureDetector(
                onTap: () =>
                    ref.read(socialAuthProvider.notifier).githubSignIn(context),
                child: const AuthButton(
                  text: 'Continue with GitHub',
                  icon: FaIcon(FontAwesomeIcons.github),
                ),
              ),
              Gaps.v12,
              const AuthButton(
                text: 'Continue with Facebook',
                icon: FaIcon(FontAwesomeIcons.facebook),
              ),
              Gaps.v12,
              const AuthButton(
                text: 'Continues with Apple',
                icon: FaIcon(FontAwesomeIcons.apple),
              ),
              Gaps.v12,
              const AuthButton(
                text: 'Continue with Google',
                icon: FaIcon(FontAwesomeIcons.google),
              ),
              Gaps.v12,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        shadowColor: Colors.black,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
