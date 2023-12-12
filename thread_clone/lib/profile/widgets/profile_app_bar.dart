import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/sizes.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      toolbarHeight: Sizes.size48,
      leading: Padding(
        padding: EdgeInsets.only(left: Sizes.size20, top: Sizes.size10),
        child: FaIcon(
          FontAwesomeIcons.globe,
          size: Sizes.size28,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: Sizes.size20),
          child: FaIcon(
            FontAwesomeIcons.instagram,
            size: Sizes.size32,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: Sizes.size20),
          child: FaIcon(
            FontAwesomeIcons.equals,
            size: Sizes.size32,
          ),
        ),
      ],
    );
  }
}
