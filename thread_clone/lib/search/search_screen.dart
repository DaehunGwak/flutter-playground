import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/models/mock/search_mock_data_util.dart';
import 'package:thread_clone/search/search_contents_screen.dart';

import '../models/user.dart';
import 'widget/search_user_list_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<User> _users = SearchMockDataUtil.getMockUsers();
  final _textEditingController = TextEditingController();

  void _onSearchContentsTap() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchContentsScreen(
          searchQuery: _textEditingController.text,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (details) => FocusScope.of(context).unfocus(),
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
                CupertinoSearchTextField(
                  style: const TextStyle(fontSize: Sizes.size16),
                  controller: _textEditingController,
                ),
                Gaps.v10,
                Expanded(
                  child: _textEditingController.text.isEmpty
                      ? ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: _users.length,
                          itemBuilder: (context, index) {
                            final user = _users.elementAt(index);
                            return SearchUserListTile(user: user);
                          },
                          separatorBuilder: (context, index) => const Divider(
                            height: Sizes.size8,
                            thickness: 0.3,
                            indent: Sizes.size56,
                          ),
                        )
                      : Column(
                          children: [
                            GestureDetector(
                              onTap: _onSearchContentsTap,
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: Sizes.size12),
                                leading: const Icon(Icons.search),
                                title: Text(
                                  "Search for \"${_textEditingController.text}\"",
                                ),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                            ),
                          ],
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
