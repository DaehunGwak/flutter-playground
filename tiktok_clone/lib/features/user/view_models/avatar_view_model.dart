import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/auth_repository.dart';
import 'package:tiktok_clone/features/user/repositories/user_repository.dart';
import 'package:tiktok_clone/features/user/view_models/user_view_model.dart';

class AvatarViewModel extends AsyncNotifier<void> {
  late final UserRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(userRepository);
  }

  Future<void> uploadAvatar(File file) async {
    state = const AsyncValue.loading();
    final uid = ref.read(authRepoProvider).user!.uid;

    state = await AsyncValue.guard(
      () async {
        await _repository.uploadProfileAvatar(uid, file);
        await ref.read(userProvider.notifier).onAvatarUpload();
      },
    );
  }
}

final avatarProvider = AsyncNotifierProvider<AvatarViewModel, void>(
  () => AvatarViewModel(),
);
