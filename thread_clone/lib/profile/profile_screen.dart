import 'package:flutter/material.dart';
import 'package:thread_clone/models/mock/feed_mock_util.dart';
import 'package:thread_clone/models/mock/profile_mock_data_util.dart';
import 'package:thread_clone/models/user.dart';
import 'package:thread_clone/profile/widgets/profile_app_bar.dart';
import 'package:thread_clone/profile/widgets/profile_button_sliver_box.dart';
import 'package:thread_clone/profile/widgets/profile_tab_view_list.dart';

import 'widgets/profile_info_sliver_box.dart';
import 'widgets/profile_tab_sliver_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User _user = ProfileMockDataUtil.getMockUser();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const ProfileAppBar(),
            ProfileInfoSliverBox(user: _user),
            const ProfileButtonSliverBox(),
            SliverPersistentHeader(
              pinned: true,
              delegate: ProfileTabSliverHeaderDelegate(),
            ),
          ],
          body: TabBarView(
            children: [
              ProfileTabViewList(feeds: FeedMockUtil.getMockFeeds()),
              ProfileTabViewList(feeds: FeedMockUtil.getMockFeeds()),
            ],
          ),
        ),
      ),
    );
  }
}
