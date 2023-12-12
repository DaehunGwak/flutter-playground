import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/settings/enums/setting_type.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black,
      leadingWidth: Sizes.size96,
      leading: const Padding(
        padding: EdgeInsets.only(top: Sizes.size6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chevron_left,
              size: Sizes.size32,
            ),
            Text(
              'Back',
              style: TextStyle(fontSize: Sizes.size16),
            )
          ],
        ),
      ),
      title: const Text(
        'Settings',
        style: TextStyle(
          fontSize: Sizes.size20,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var type in SettingType.values)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size14),
            child: ListTile(
              leading: FaIcon(
                type.iconData,
                size: (type == SettingType.followAndInviteFriends)
                    ? Sizes.size20
                    : Sizes.size28,
              ),
              title: Text(
                type.data,
                style: const TextStyle(fontSize: Sizes.size16),
              ),
            ),
          ),
        const Divider(
          thickness: 0.3,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size8,
            horizontal: Sizes.size32,
          ),
          child: Text(
            'Log out',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: Sizes.size16,
            ),
          ),
        )
      ],
    );
  }
}
