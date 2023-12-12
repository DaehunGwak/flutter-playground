import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../models/user.dart';

class ProfileInfoSliverBox extends StatelessWidget {
  const ProfileInfoSliverBox({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v14,
            _buildListTile(),
            Gaps.v6,
            Text(
              _user.description!,
              style: const TextStyle(fontSize: Sizes.size16),
            ),
            Gaps.v10,
            _buildFollowers()
          ],
        ),
      ),
    );
  }

  Widget _buildListTile() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
        vertical: Sizes.size4,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: Sizes.size6),
        child: Text(
          _user.name!,
          style: const TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            _user.nickname,
            style: const TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.h6,
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size6,
              horizontal: Sizes.size10,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(Sizes.size32),
            ),
            child: const Text(
              'threads.net',
              style: TextStyle(
                color: Colors.grey,
                fontSize: Sizes.size14,
              ),
            ),
          )
        ],
      ),
      trailing: CircleAvatar(
        radius: Sizes.size48,
        foregroundColor: Colors.grey.shade300,
        foregroundImage: NetworkImage(_user.profileImageUrl),
      ),
    );
  }

  Widget _buildFollowers() {
    return Row(
      children: [
        _buildCircleAvatars2(),
        Gaps.h10,
        Text(
          '${_user.formattedFollowerCount} followers',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: Sizes.size16,
          ),
        ),
      ],
    );
  }

  Widget _buildCircleAvatars2() {
    return SizedBox(
      width: 42,
      height: 42,
      child: Center(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(-5, 4),
              child: _buildCircleAvatar(
                size: Sizes.size12,
                imageUrl: _user.followerImageUrls.elementAt(0),
              ),
            ),
            Transform.translate(
              offset: const Offset(10, 0),
              child: CircleAvatar(
                radius: Sizes.size16,
                backgroundColor: Colors.white,
                child: _buildCircleAvatar(
                  size: Sizes.size12,
                  imageUrl: _user.followerImageUrls.elementAt(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CircleAvatar _buildCircleAvatar({
    required double size,
    required String imageUrl,
  }) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Colors.grey,
      foregroundImage: NetworkImage(imageUrl),
      child: const FaIcon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
    );
  }
}
