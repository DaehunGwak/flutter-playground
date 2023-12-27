import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/video/models/video_model.dart';
import 'package:tiktok_clone/features/video/repositories/video_repo.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideoRepository _repository;

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.read(videoRepoProvider);
    return await _repository.fetchVideos();
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
