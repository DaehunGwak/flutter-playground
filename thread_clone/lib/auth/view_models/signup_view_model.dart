import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/auth/repositories/firebase_auth_repository.dart';
import 'package:thread_clone/auth/utils/firebase_utils.dart';
import 'package:thread_clone/navigation/main_navigation_screen.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final FirebaseAuthRepository _authRepo;

  @override
  FutureOr<void> build() async {
    _authRepo = ref.read(firebaseAuthRepoProvider);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    debugPrint(form.toString());
    state = await AsyncValue.guard(() async {
      await _authRepo.emailSignUp(
        form['email'],
        form['password'],
      );
    });
    if (state.hasError && context.mounted) {
      showFirebaseExceptionSnackBar(context, state.error!);
      return;
    }
    if (context.mounted) {
      context.go(MainNavigationScreen.routeUrl);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider =
    AsyncNotifierProvider<SignUpViewModel, void>(() => SignUpViewModel());
