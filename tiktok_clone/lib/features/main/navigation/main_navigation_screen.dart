import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/main/discover/discover_screen.dart';
import 'package:tiktok_clone/features/main/home/views/home_test_screen.dart';
import 'package:tiktok_clone/features/main/navigation/widgets/navigation_tab.dart';
import 'package:tiktok_clone/features/main/navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/user/views/user_profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  bool _isBlackTheme = false;

  _onTab(int index) {
    setState(() {
      _selectedIndex = index;
      _isBlackTheme = _selectedIndex == 0;
    });
    debugPrint('index: $index, isBlackTheme: $_isBlackTheme');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeTestScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(username: 'Daehun Gwak'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _isBlackTheme ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.h12,
            MainNavigationTab(
              text: 'Home',
              iconData: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              isBlackTheme: _isBlackTheme,
              onTap: () => _onTab(0),
            ),
            MainNavigationTab(
              text: 'Discover',
              iconData: FontAwesomeIcons.compass,
              selectedIconData: FontAwesomeIcons.solidCompass,
              isSelected: _selectedIndex == 1,
              isBlackTheme: _isBlackTheme,
              onTap: () => _onTab(1),
            ),
            Gaps.h24,
            GestureDetector(
              onTap: () {
                _onPostVideoButtonTap();
              },
              child: PostVideoButton(isBlackTheme: _isBlackTheme),
            ),
            Gaps.h24,
            MainNavigationTab(
              text: 'Inbox',
              iconData: FontAwesomeIcons.message,
              selectedIconData: FontAwesomeIcons.solidMessage,
              isSelected: _selectedIndex == 3,
              isBlackTheme: _isBlackTheme,
              onTap: () => _onTab(3),
            ),
            MainNavigationTab(
              text: 'Profile',
              iconData: FontAwesomeIcons.user,
              selectedIconData: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              isBlackTheme: _isBlackTheme,
              onTap: () => _onTab(4),
            ),
            Gaps.h12,
          ],
        ),
      ),
    );
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Record Video'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
