import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/user/view_models/user_view_model.dart';
import 'package:tiktok_clone/features/video/models/video_model.dart';
import 'package:tiktok_clone/features/video/repositories/video_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideoRepository _videoRepository;

  @override
  FutureOr<void> build() {
    _videoRepository = ref.read(videoRepoProvider);
  }

  Future<void> uploadVideo(File file, BuildContext context) async {
    state = const AsyncValue.loading();

    final userProfile = ref.read(userProvider).value!;

    state = await AsyncValue.guard(() async {
      final taskSnapshot =
          await _videoRepository.uploadVideoFile(file, userProfile.uid);
      if (taskSnapshot.metadata != null) {
        await _videoRepository.saveVideo(
          VideoModel(
            title: 'From Flutter!',
            description: 'Hell yeah!',
            fileUrl: await taskSnapshot.ref.getDownloadURL(),
            thumbnailUrl: "",
            creatorUid: userProfile.uid,
            creatorName: userProfile.name,
            likes: 0,
            comments: 0,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
      }
    });

    if (state.hasError) {
      return;
    }
    if (context.mounted) {
      context.go('/home');
    }
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
