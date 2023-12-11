import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            foregroundImage: NetworkImage(activity.imageUrl),
          ),
          Transform.translate(
            offset: const Offset(Sizes.size24, Sizes.size24),
            child: _buildLeadingIcon(),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      width: Sizes.size20,
      height: Sizes.size20,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          width: Sizes.size16,
          height: Sizes.size16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getActivityColor(),
          ),
          child: Center(
            child: _getActivityIcon(),
          ),
        ),
      ),
    );
  }

  Color _getActivityColor() {
    if (activity.type == ActivityType.mentions) {
      return Colors.lightGreen;
    }
    if (activity.type == ActivityType.replies) {
      return Colors.lightBlueAccent;
    }
    if (activity.type == ActivityType.follows) {
      return Colors.deepPurpleAccent;
    }
    if (activity.type == ActivityType.like) {
      return Colors.pinkAccent;
    }
    return Colors.grey;
  }

  FaIcon _getActivityIcon() {
    if (activity.type == ActivityType.mentions) {
      return const FaIcon(
        FontAwesomeIcons.threads,
        size: Sizes.size10,
        color: Colors.white,
      );
    }
    if (activity.type == ActivityType.replies) {
      return const FaIcon(
        FontAwesomeIcons.reply,
        size: Sizes.size10,
        color: Colors.white,
      );
    }
    if (activity.type == ActivityType.follows) {
      return const FaIcon(
        FontAwesomeIcons.solidUser,
        size: Sizes.size10,
        color: Colors.white,
      );
    }
    if (activity.type == ActivityType.like) {
      return const FaIcon(
        FontAwesomeIcons.solidHeart,
        size: Sizes.size10,
        color: Colors.white,
      );
    }
    return const FaIcon(
      FontAwesomeIcons.question,
      size: Sizes.size10,
      color: Colors.white,
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
