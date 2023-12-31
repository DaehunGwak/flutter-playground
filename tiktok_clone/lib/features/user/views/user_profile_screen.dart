import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/user/view_models/user_view_model.dart';
import 'package:tiktok_clone/features/user/views/widgets/persistent_tabbar.dart';
import 'package:tiktok_clone/features/user/views/widgets/profile_avatar.dart';

import '../../util/mock_util.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({
    super.key,
    required this.username,
    this.tab = '',
  });

  final String username;
  final String tab;

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  final imageUrls = [
    for (int i = 0; i < 20; i++)
      MockUtils.getMockImageUrl(width: 500, height: 300 * 16 ~/ 9),
  ];
  final profileImageUrls = [
    for (int i = 0; i < 20; i++)
      MockUtils.getMockProfileImageUrl(width: 30, height: 30),
  ];

  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(userProvider).when(
          error: (e, s) => Center(
            child: Text(e.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (profile) => SafeArea(
            child: DefaultTabController(
              initialIndex: widget.tab == 'likes' ? 1 : 0,
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      title: Text(profile.name),
                      actions: [
                        IconButton(
                          onPressed: _onGearPressed,
                          icon: const FaIcon(
                            FontAwesomeIcons.gear,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          ProfileAvatar(
                            name: profile.name,
                            hasAvatar: profile.hasAvatar,
                            uid: profile.uid,
                          ),
                          Gaps.v20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '@${profile.name}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.h5,
                              FaIcon(
                                FontAwesomeIcons.solidCircleCheck,
                                size: Sizes.size16,
                                color: Colors.blue.shade500,
                              ),
                            ],
                          ),
                          Gaps.v24,
                          SizedBox(
                            height: Sizes.size44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      '97',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Sizes.size18,
                                      ),
                                    ),
                                    Gaps.v5,
                                    Text(
                                      'Following',
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  width: Sizes.size32,
                                  thickness: Sizes.size1,
                                  indent: Sizes.size8,
                                  endIndent: Sizes.size8,
                                  color: Colors.grey.shade300,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      '10M',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Sizes.size18,
                                      ),
                                    ),
                                    Gaps.v5,
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  width: Sizes.size32,
                                  thickness: Sizes.size1,
                                  indent: Sizes.size8,
                                  endIndent: Sizes.size8,
                                  color: Colors.grey.shade300,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      '168.2M',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Sizes.size18,
                                      ),
                                    ),
                                    Gaps.v5,
                                    Text(
                                      'Likes',
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Gaps.v14,
                          FractionallySizedBox(
                            widthFactor: 0.33,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius:
                                    BorderRadius.circular(Sizes.size4),
                              ),
                              child: const Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Gaps.v14,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size32,
                            ),
                            child: Text(
                              profile.bio,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Gaps.v14,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.link,
                                size: Sizes.size12,
                              ),
                              Gaps.v8,
                              Text(
                                profile.link,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Gaps.v20,
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: PersistentTabBar(),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: EdgeInsets.zero,
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: Sizes.size2,
                        mainAxisSpacing: Sizes.size2,
                        childAspectRatio: 3 / 4,
                      ),
                      itemBuilder: (context, index) => Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 3 / 4,
                            child: Image.network(
                              imageUrls.elementAt(index),
                              fit: BoxFit
                                  .cover, // NEW: 부모 위젯의 사이즈에 어떻게 피팅할것인가? 를 지정
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: Text('page 2'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
