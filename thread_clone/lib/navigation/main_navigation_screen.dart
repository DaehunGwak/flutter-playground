import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/models/screen_type.dart';
import 'package:thread_clone/navigation/widget/main_navigaion_destination.dart';
import 'package:thread_clone/notification/notification_screen.dart';
import 'package:thread_clone/profile/profile_screen.dart';
import 'package:thread_clone/search/search_screen.dart';
import 'package:thread_clone/settings/settings_screen.dart';
import 'package:thread_clone/timeline/timeline_screen.dart';
import 'package:thread_clone/write/write_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({
    super.key,
    this.startScreenType = ScreenType.home,
  });

  static const routeUrl = '/';

  final ScreenType startScreenType;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  // TODO: void 를 넣고 안넣고의 차이는?
  void _onNavigationSelected(int index) async {
    if (index != 2) {
      setState(() {
        _currentIndex = index;
      });
      return;
    }
    await showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      builder: (context) => const WriteScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = switch (widget.startScreenType) {
      ScreenType.home => 0,
      ScreenType.search => 1,
      ScreenType.activity => 3,
      ScreenType.profile => 4,
      ScreenType.settings => 4,
      ScreenType.settingsPrivacy => 4,
    };
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.startScreenType == ScreenType.settings ||
          widget.startScreenType == ScreenType.settingsPrivacy) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SettingsScreen(
              isRoutePrivacy:
                  widget.startScreenType == ScreenType.settingsPrivacy,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: const TimelineScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: const NotificationScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: const ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: NavigationBar(
          height: Sizes.size64,
          selectedIndex: _currentIndex,
          onDestinationSelected: _onNavigationSelected,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          indicatorColor: Theme.of(context).colorScheme.background,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            MainNavigationDestination(
              iconData: FontAwesomeIcons.house,
            ),
            MainNavigationDestination(
              iconData: FontAwesomeIcons.magnifyingGlass,
            ),
            MainNavigationDestination(
              iconData: FontAwesomeIcons.squarePlus,
              selectedIconData: FontAwesomeIcons.solidSquarePlus,
            ),
            MainNavigationDestination(
              iconData: FontAwesomeIcons.heart,
              selectedIconData: FontAwesomeIcons.solidHeart,
            ),
            MainNavigationDestination(
              iconData: FontAwesomeIcons.user,
              selectedIconData: FontAwesomeIcons.solidUser,
            ),
          ],
        ),
      ),
    );
  }
}
