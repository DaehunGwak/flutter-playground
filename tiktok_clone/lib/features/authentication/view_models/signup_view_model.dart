import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repositories/auth_repository.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/user/view_models/user_view_model.dart';
import 'package:tiktok_clone/features/util/common_utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepo;

  @override
  FutureOr<void> build() async {
    _authRepo = ref.read(authRepoProvider);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.emailSignUp(
        form['email'],
        form['password'],
      );
      await ref.read(userProvider.notifier).createProfile(userCredential);
    });
    if (state.hasError && context.mounted) {
      showFirebaseExceptionSnackBar(context, state.error!);
      return;
    }
    if (context.mounted) {
      context.goNamed(InterestsScreen.routeName);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider =
    AsyncNotifierProvider<SignUpViewModel, void>(() => SignUpViewModel());
