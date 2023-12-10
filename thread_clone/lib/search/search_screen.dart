import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/models/mock/search_mock_data_util.dart';

import '../models/user.dart';
import 'widget/search_user_list_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<User> _users = SearchMockDataUtil.getMockUsers();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragDown: (details) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: Sizes.size32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                Gaps.v10,
                const CupertinoSearchTextField(
                  style: TextStyle(fontSize: Sizes.size16),
                ),
                Gaps.v10,
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      final user = _users.elementAt(index);
                      return SearchUserListTile(user: user);
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 0.5,
                      thickness: 0.3,
                      indent: Sizes.size56,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
