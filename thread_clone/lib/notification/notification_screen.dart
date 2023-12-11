import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/models/mock/activity_mock_data_util.dart';
import 'package:thread_clone/notification/widget/activity_list_tile.dart';
import "../extension/string_extension.dart";

import '../constants/gaps.dart';
import '../models/activity.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Activity> _activities = ActivityMockDataUtil.getActivities();

  late ActivityType _selectedTabType;

  void _onTabBarTap(int index) {
    setState(() {
      _selectedTabType = ActivityType.values.elementAt(index);
    });
  }

  @override
  void initState() {
    _selectedTabType = ActivityType.all;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ActivityType.values.length - 1,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              Gaps.v10,
              _buildTabBar(),
              Gaps.v14,
              Expanded(
                child: _buildTabBarView(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: Text(
        'Activity',
        style: TextStyle(
          fontSize: Sizes.size32,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      onTap: _onTabBarTap,
      isScrollable: true,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      labelPadding: const EdgeInsets.only(right: Sizes.size10),
      tabAlignment: TabAlignment.start,
      splashFactory: NoSplash.splashFactory,
      indicatorColor: Colors.transparent,
      indicator: const BoxDecoration(color: Colors.transparent),
      dividerColor: Colors.transparent,
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      tabs: [
        for (var type
            in ActivityType.values.where((e) => e != ActivityType.like))
          Container(
            height: Sizes.size36,
            width: Sizes.size96,
            decoration: BoxDecoration(
              color: (_selectedTabType == type) ? Colors.black : Colors.white,
              border: Border.all(
                color: (_selectedTabType == type)
                    ? Colors.black
                    : Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
            child: Center(
              child: Text(type.name.capitalize()),
            ),
          )
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        _buildTabBarViewChild(_activities),
        _buildTabBarViewChild(
          _activities.where((e) => e.type == ActivityType.follows).toList(),
        ),
        _buildTabBarViewChild(
          _activities.where((e) => e.type == ActivityType.replies).toList(),
        ),
        _buildTabBarViewChild(
          _activities.where((e) => e.type == ActivityType.mentions).toList(),
        ),
        _buildTabBarViewChild(
          _activities.where((e) => e.type == ActivityType.quotes).toList(),
        ),
        _buildTabBarViewChild(
          _activities.where((e) => e.type == ActivityType.reposts).toList(),
        ),
        _buildTabBarViewChild(
          _activities.where((e) => e.type == ActivityType.verified).toList(),
        ),
      ],
    );
  }

  Widget _buildTabBarViewChild(List<Activity> activities) {
    return (activities.isEmpty)
        ? const Center(
            child: Text('Nothing to see here yet'),
          )
        : ListView.separated(
            itemCount: activities.length,
            itemBuilder: (context, index) => ActivityListTile(
              activity: activities.elementAt(index),
            ),
            separatorBuilder: (context, index) => const Divider(
              height: Sizes.size14,
              thickness: 0.3,
              indent: Sizes.size76,
            ),
          );
  }
}
