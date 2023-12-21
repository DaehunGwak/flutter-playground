import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/settings/view_models/setting_view_model.dart';
import 'package:thread_clone/settings/views/enums/setting_type.dart';
import 'package:thread_clone/settings/views/settings_privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    this.isRoutePrivacy = false,
  });

  final bool isRoutePrivacy;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isRoutePrivacy) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SettingsPrivacyScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Theme.of(context).colorScheme.background,
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
        Padding(
          padding: const EdgeInsets.only(left: Sizes.size10),
          child: SwitchListTile.adaptive(
            value: context.watch<SettingViewModel>().isDarkMode,
            onChanged: (value) =>
                context.read<SettingViewModel>().setDarkMode(value),
            activeColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.9),
            activeTrackColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
            inactiveThumbColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
            inactiveTrackColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
            title: const Row(
              children: [
                Icon(
                  Icons.ad_units_rounded,
                  size: Sizes.size28,
                ),
                Gaps.h16,
                Text('Dark Mode'),
              ],
            ),
          ),
        ),
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
