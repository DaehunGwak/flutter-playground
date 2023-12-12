import 'package:flutter/material.dart';

import '../../models/feed.dart';
import '../../timeline/widgets/feed_widget.dart';

class ProfileTabViewList extends StatelessWidget {
  const ProfileTabViewList({
    super.key,
    required List<Feed> feeds,
  }) : _feeds = feeds;

  final List<Feed> _feeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _feeds.length,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedWidget(feed: _feeds.elementAt(index)),
          const Divider(
            thickness: 0.2,
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
