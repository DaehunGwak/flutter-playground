import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/auth_repository.dart';
import 'package:tiktok_clone/features/video/repositories/video_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideoRepository _videoRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _videoRepository = ref.read(videoRepoProvider);
    _authRepository = ref.read(authRepoProvider);
  }

  Future<void> uploadVideo(File file) async {
    state = const AsyncValue.loading();

    final user = _authRepository.user!;
    state = await AsyncValue.guard(() async {
      final taskSnapshot =
          await _videoRepository.uploadVideoFile(file, user.uid);
      if (taskSnapshot.metadata != null) {
        // await _videoRepository.saveVideo();
      }
    });
  }
}
