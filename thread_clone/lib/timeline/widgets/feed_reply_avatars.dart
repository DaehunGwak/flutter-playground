import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/sizes.dart';
import '../../models/feed.dart';

class FeedReplyAvatars extends StatelessWidget {
  final Feed feed;

  const FeedReplyAvatars({
    super.key,
    required this.feed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: 58,
          height: 42,
        ),
        if (feed.replyCount == 1) _buildCircleAvatars1(context),
        if (feed.replyCount == 2) _buildCircleAvatars2(context),
        if (feed.replyCount >= 3) _buildCircleAvatars3(context),
      ],
    );
  }

  Widget _buildCircleAvatars1(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 42,
      child: Center(
        child: _buildCircleAvatar(
          context,
          size: Sizes.size12,
          imageUrl: feed.replyCandidateUsers.elementAt(0).profileImageUrl,
        ),
      ),
    );
  }

  Widget _buildCircleAvatars2(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 42,
      child: Center(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(-5, 4),
              child: _buildCircleAvatar(
                context,
                size: Sizes.size12,
                imageUrl: feed.replyCandidateUsers.elementAt(0).profileImageUrl,
              ),
            ),
            Transform.translate(
              offset: const Offset(10, 0),
              child: CircleAvatar(
                radius: Sizes.size16,
                backgroundColor: Theme.of(context).colorScheme.background,
                child: _buildCircleAvatar(
                  context,
                  size: Sizes.size12,
                  imageUrl:
                      feed.replyCandidateUsers.elementAt(1).profileImageUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAvatars3(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 42,
      child: Center(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(14, -10),
              child: _buildCircleAvatar(
                context,
                size: 13,
                imageUrl: feed.replyCandidateUsers.elementAt(0).profileImageUrl,
              ),
            ),
            Transform.translate(
              offset: const Offset(-14, 0),
              child: _buildCircleAvatar(
                context,
                size: Sizes.size10,
                imageUrl: feed.replyCandidateUsers.elementAt(1).profileImageUrl,
              ),
            ),
            Transform.translate(
              offset: const Offset(8, 20),
              child: _buildCircleAvatar(
                context,
                size: Sizes.size8,
                imageUrl: feed.replyCandidateUsers.elementAt(2).profileImageUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }

  CircleAvatar _buildCircleAvatar(
    BuildContext context, {
    required double size,
    required String imageUrl,
  }) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Colors.grey,
      foregroundImage: NetworkImage(imageUrl),
      child: FaIcon(
        FontAwesomeIcons.user,
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
