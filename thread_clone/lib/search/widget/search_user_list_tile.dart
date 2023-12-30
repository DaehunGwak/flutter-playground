import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../models/user.dart';

class SearchUserListTile extends StatelessWidget {
  const SearchUserListTile({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      contentPadding: EdgeInsets.zero,
      leading: _buildLeading(),
      title: _buildUserInfo(),
      trailing: _buildTrailing(),
    );
  }

  Padding _buildLeading() {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.size2),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        foregroundImage: NetworkImage(user.profileImageUrl),
      ),
    );
  }

  Column _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              user.nickname,
              style: const TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.h4,
            if (user.confirmed) _buildUserInfoConfirmedBadge(),
          ],
        ),
        Text(
          user.name ?? '',
          style: const TextStyle(
            fontSize: Sizes.size14,
            color: Colors.grey,
          ),
        ),
        Gaps.v10,
        Text(
          '${user.formattedFollowerCount} followers',
          style: const TextStyle(fontSize: Sizes.size12),
        )
      ],
    );
  }

  Stack _buildUserInfoConfirmedBadge() {
    return const Stack(
      children: [
        SizedBox(
          height: Sizes.size14,
          width: Sizes.size14,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.certificate,
              size: Sizes.size12,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          height: Sizes.size14,
          width: Sizes.size14,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: Sizes.size2),
              child: FaIcon(
                FontAwesomeIcons.check,
                color: Colors.white,
                size: Sizes.size6,
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding _buildTrailing() {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.size4),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size28,
          vertical: Sizes.size5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: const Text(
          'Follow',
          style: TextStyle(
            fontSize: Sizes.size14,
          ),
        ),
      ),
    );
  }
}
