import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/timeline/timeline_screen.dart';
import 'package:thread_clone/navigation/widget/main_navigaion_destination.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // TODO: void 를 넣고 안넣고의 차이는?
  _onNavigationSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.threads,
          size: Sizes.size44,
        ),
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: TimelineScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: const Center(child: Text('dummy search')),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: const Center(child: Text('dummy write')),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: const Center(child: Text('dummy notification')),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: const Center(child: Text('dummy user')),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: _onNavigationSelected,
          elevation: 0,
          backgroundColor: Colors.white,
          indicatorColor: Colors.white,
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