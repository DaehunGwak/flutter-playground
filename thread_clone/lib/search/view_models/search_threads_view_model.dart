import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/models/feed.dart';
import 'package:thread_clone/search/repositories/search_threads_repository.dart';

class SearchThreadsViewModel extends AsyncNotifier<List<Feed>> {
  late final SearchThreadsFirestoreRepository _repository;

  @override
  FutureOr<List<Feed>> build() async {
    _repository = ref.read(searchThreadsFirestoreRepository);
    return List.empty();
  }

  Future<List<Feed>> searchContent(String content) async {
    await Future.delayed(const Duration(milliseconds: 300));
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final threads = await _repository.searchThreadsByContent(content);
      debugPrint(threads.toString());
      return threads.map((e) => Feed.fromThread(e)).toList();
    });
    if (state.hasError) {
      debugPrint(state.error.toString());
    }
    return state.value!;
  }
}

final searchThreadsViewModel =
    AsyncNotifierProvider<SearchThreadsViewModel, List<Feed>>(
  () => SearchThreadsViewModel(),
);
