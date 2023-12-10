import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/models/activity.dart';

import '../../constants/sizes.dart';

class ActivityListTile extends StatelessWidget {
  const ActivityListTile({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      contentPadding: EdgeInsets.zero,
      leading: _buildLeading(),
      title: _buildActivityInfo(),
      trailing:
          (activity.type == ActivityType.follows) ? _buildTrailing() : null,
    );
  }

  Widget _buildLeading() {
    return Padding(
      padding: const EdgeInsets.only(
        top: Sizes.size2,
        left: Sizes.size20,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        foregroundImage: NetworkImage(activity.imageUrl),
      ),
    );
  }

  Widget _buildActivityInfo() {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.size36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activity.title,
            style: const TextStyle(
              fontSize: Sizes.size14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            activity.subTitle,
            style: const TextStyle(
              fontSize: Sizes.size14,
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (activity.content.isNotEmpty) Gaps.v6,
          if (activity.content.isNotEmpty)
            Text(
              activity.content,
              style: const TextStyle(
                fontSize: Sizes.size14,
              ),
            )
        ],
      ),
    );
  }

  Widget _buildTrailing() {
    return Padding(
      padding: const EdgeInsets.only(
        right: Sizes.size36,
        top: Sizes.size5,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
          vertical: Sizes.size5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: const Text(
          'Following',
          style: TextStyle(
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }
}
