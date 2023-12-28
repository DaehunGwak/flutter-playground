import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/models/feed.dart';
import 'package:thread_clone/models/mock/feed_mock_util.dart';

class SearchThreadsViewModel extends AsyncNotifier<List<Feed>> {
  @override
  FutureOr<List<Feed>> build() async {
    return FeedMockUtil.getMockFeeds();
  }
}

final searchThreadsViewModel =
    AsyncNotifierProvider<SearchThreadsViewModel, List<Feed>>(
  () => SearchThreadsViewModel(),
);
