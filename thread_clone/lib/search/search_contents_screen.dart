import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/models/feed.dart';
import 'package:thread_clone/search/view_models/search_threads_view_model.dart';
import 'package:thread_clone/timeline/widgets/feed_widget.dart';

class SearchContentsScreen extends ConsumerStatefulWidget {
  const SearchContentsScreen({
    super.key,
    required this.searchQuery,
  });

  final String searchQuery;

  @override
  ConsumerState<SearchContentsScreen> createState() =>
      _SearchContentsScreenState();
}

class _SearchContentsScreenState extends ConsumerState<SearchContentsScreen> {
  bool isLoading = true;
  List<Feed> feeds = [];
  Future<void> _doSearch() async {
    feeds = await ref
        .read(searchThreadsViewModel.notifier)
        .searchContent(widget.searchQuery);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _doSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchQuery),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : _buildFeedListView(),
    );
  }

  Widget _buildFeedListView() {
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
