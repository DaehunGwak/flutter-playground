import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repositories/auth_repository.dart';
import 'package:tiktok_clone/features/util/common_utils.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepoProvider);
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repository.signIn(email, password),
    );
    if (state.hasError && context.mounted) {
      showFirebaseExceptionSnackBar(context, state.error!);
      return;
    }
    if (context.mounted) {
      context.go('/home');
    }
  }
}

final loginProvider =
    AsyncNotifierProvider<LoginViewModel, void>(() => LoginViewModel());
