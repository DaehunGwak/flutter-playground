import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/settings/views/settings_screen.dart';

import '../../constants/sizes.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  void _onSettingsTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: Sizes.size48,
      leading: const Padding(
        padding: EdgeInsets.only(left: Sizes.size20, top: Sizes.size10),
        child: FaIcon(
          FontAwesomeIcons.globe,
          size: Sizes.size28,
        ),
      ),
      actions: [
        const Padding(
          padding: EdgeInsets.only(right: Sizes.size20),
          child: FaIcon(
            FontAwesomeIcons.instagram,
            size: Sizes.size32,
          ),
        ),
        GestureDetector(
          onTap: () => _onSettingsTap(context),
          child: const Padding(
            padding: EdgeInsets.only(right: Sizes.size20),
            child: FaIcon(
              FontAwesomeIcons.equals,
              size: Sizes.size32,
            ),
          ),
        ),
      ],
    );
  }
}
