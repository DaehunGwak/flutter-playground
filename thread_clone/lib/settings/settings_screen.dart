import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/settings/enums/setting_type.dart';
import 'package:thread_clone/settings/settings_privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

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
        'Settings',
        style: TextStyle(
          fontSize: Sizes.size20,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  void _onListTileTap(BuildContext context, SettingType nowType) {
    if (nowType != SettingType.privacy) {
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsPrivacyScreen(),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 0.3,
        ),
        for (var type in SettingType.values)
          GestureDetector(
            onTap: () => _onListTileTap(context, type),
            child: Padding(
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
          ),
        const Divider(
          thickness: 0.3,
        ),
        GestureDetector(
          onTap: () => showAdaptiveDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text('Are you sure?'),
              actions: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Text('Yes'),
                ),
              ],
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
