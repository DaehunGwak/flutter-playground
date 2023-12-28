import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';

import '../../constants/sizes.dart';
import '../../models/feed.dart';

class FeedImagesWidget extends StatelessWidget {
  const FeedImagesWidget({
    super.key,
    required this.feed,
  });

  final Feed feed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gaps.h80,
          for (var imageUrl in feed.contentImageUrls)
            Padding(
              padding: const EdgeInsets.only(right: Sizes.size12),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 210,
                  maxHeight: 210,
                ),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(Sizes.size12),
                ),
                child: Image.network(imageUrl),
              ),
            ),
          Gaps.h8,
        ],
      ),
    );
  }
}
