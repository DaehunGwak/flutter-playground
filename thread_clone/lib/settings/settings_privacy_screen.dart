import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';

import '../constants/sizes.dart';

class SettingsPrivacyScreen extends StatefulWidget {
  const SettingsPrivacyScreen({super.key});

  @override
  State<SettingsPrivacyScreen> createState() => _SettingsPrivacyScreenState();
}

class _SettingsPrivacyScreenState extends State<SettingsPrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  bool _isPrivateProfile = false;

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leadingWidth: Sizes.size96,
      toolbarHeight: Sizes.size36,
      leading: Padding(
        padding: const EdgeInsets.only(top: Sizes.size6),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Row(
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
      ),
      title: const Text(
        'Privacy',
        style: TextStyle(
          fontSize: Sizes.size20,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  void _togglePrivateProfileState(bool value) {
    setState(() {
      _isPrivateProfile = value;
    });
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 0.3),
        SwitchListTile.adaptive(
          value: _isPrivateProfile,
          onChanged: _togglePrivateProfileState,
          activeColor: Colors.black,
          activeTrackColor: Colors.grey,
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.grey.shade300,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size6),
            child: Row(
              children: [
                Icon(Icons.lock_outline),
                Gaps.h16,
                Text('Private profile')
              ],
            ),
          ),
        ),
        _buildListTile(
          iconData: FontAwesomeIcons.at,
          text: 'Mentions',
          trailingText: 'Everyone',
        ),
        _buildListTile(
          iconData: FontAwesomeIcons.bellSlash,
          iconSize: Sizes.size20,
          text: 'Muted',
        ),
        _buildListTile(
          iconData: FontAwesomeIcons.eyeSlash,
          iconSize: Sizes.size20,
          text: 'Hidden Words',
        ),
        _buildListTile(
          iconData: FontAwesomeIcons.userGroup,
          iconSize: Sizes.size20,
          text: 'Profiles you follow',
        ),
        const Divider(thickness: 0.3),
        _buildListTile(
          text: 'Other privacy settings',
          subText: 'Some settings, like restrict, apply to both Threads'
              'and Instagram and can be managed on Instagram.',
          trailingIconData: FontAwesomeIcons.arrowUpRightFromSquare,
        ),
        _buildListTile(
          iconData: FontAwesomeIcons.circleXmark,
          text: 'Blocked profiles',
          trailingIconData: FontAwesomeIcons.arrowUpRightFromSquare,
        ),
        _buildListTile(
          iconData: FontAwesomeIcons.userGroup,
          iconSize: Sizes.size20,
          text: 'Profiles you follow',
          trailingIconData: FontAwesomeIcons.arrowUpRightFromSquare,
        ),
      ],
    );
  }

  ListTile _buildListTile({
    IconData? iconData,
    double iconSize = Sizes.size24,
    required String text,
    String subText = '',
    IconData trailingIconData = FontAwesomeIcons.chevronRight,
    double trailingIconSize = Sizes.size20,
    String trailingText = '',
  }) {
    return ListTile(
      titleAlignment: (iconData == null) ? ListTileTitleAlignment.top : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 22),
      leading: (iconData == null)
          ? null
          : FaIcon(
              iconData,
              size: iconSize,
            ),
      title: Text(text),
      subtitle: (subText.isEmpty) ? null : Padding(
        padding: const EdgeInsets.only(top: Sizes.size8),
        child: Text(subText),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText.isNotEmpty)
            Text(
              trailingText,
              style: const TextStyle(
                fontSize: Sizes.size14,
                color: Colors.grey,
              ),
            ),
          Gaps.h8,
          Icon(
            trailingIconData,
            size: trailingIconSize,
            color: Colors.grey,
          ),
          Gaps.h4,
        ],
      ),
    );
  }
}
