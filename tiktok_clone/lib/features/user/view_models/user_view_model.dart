import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/auth_repository.dart';
import 'package:tiktok_clone/features/user/models/user_profile_model.dart';
import 'package:tiktok_clone/features/user/repositories/user_repository.dart';

class UserViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _userRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    _userRepository = ref.read(userRepository);
    _authRepository = ref.read(authRepoProvider);

    if (_authRepository.isLoggedIn && _authRepository.user != null) {
      return await _userRepository.findProfile(_authRepository.user!.uid);
    }
    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }
    state = const AsyncValue.loading();
    final model = UserProfileModel(
      uid: credential.user!.uid,
      name: credential.user!.displayName ?? "Anonymous",
      email: credential.user!.email ?? "anonymous@anon.com",
      bio: "undefined",
      link: "undefined",
      hasAvatar: false,
    );
    await _userRepository.createProfile(model);
    state = AsyncValue.data(model);
  }

  Future<void> onAvatarUpload() async {
    if (state.value == null) {
      return;
    }
    state = AsyncValue.data(
      state.value!.copyWith(hasAvatar: true),
    );
    await _userRepository.updateProfile(state.value!);
  }
}

final userProvider = AsyncNotifierProvider<UserViewModel, UserProfileModel>(
  () => UserViewModel(),
);
