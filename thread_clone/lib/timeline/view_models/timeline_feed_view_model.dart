import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/models/feed.dart';
import 'package:thread_clone/timeline/repositories/timeline_thread_firestore_repository.dart';

class TimelineFeedViewModel extends AsyncNotifier<List<Feed>> {
  late final TimelineThreadFirestoreRepository _repository;

  @override
  FutureOr<List<Feed>> build() async {
    _repository = ref.read(timelineThreadFirestoreRepository);
    final threads = await _repository.getAllThreadsOrderByCreatedTimeDesc();
    return threads.map((e) => Feed.fromThread(e)).toList();
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final threads = await _repository.getAllThreadsOrderByCreatedTimeDesc();
      return threads.map((e) => Feed.fromThread(e)).toList();
    });
  }
}

final timelineFeedViewModel =
    AsyncNotifierProvider<TimelineFeedViewModel, List<Feed>>(
  () => TimelineFeedViewModel(),
);
