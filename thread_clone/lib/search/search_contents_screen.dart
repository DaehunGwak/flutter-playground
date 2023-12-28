import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/search/view_models/search_threads_view_model.dart';
import 'package:thread_clone/timeline/widgets/feed_widget.dart';

class SearchContentsScreen extends ConsumerWidget {
  const SearchContentsScreen({
    super.key,
    required this.searchQuery,
  });

  final String searchQuery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchQuery),
      ),
      body: ref.watch(searchThreadsViewModel).isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : _buildFeedListView(ref),
    );
  }

  Widget _buildFeedListView(WidgetRef ref) {
    final feeds = ref.read(searchThreadsViewModel).value ?? List.empty();
    return feeds.isEmpty
        ? const Center(
            child: Text("It's empty. 🫥"),
          )
        : LayoutBuilder(
            builder: (context, viewportConstraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: viewportConstraints.maxHeight,
                ),
                child: ListView.builder(
                  itemCount: feeds.length,
                  itemBuilder: (context, index) => FeedWidget(
                    feed: feeds.elementAt(index),
                  ),
                ),
              ),
            ),
          );
  }
}
