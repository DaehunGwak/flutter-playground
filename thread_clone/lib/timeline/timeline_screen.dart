import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/timeline/view_models/timeline_feed_view_model.dart';

import '../constants/sizes.dart';
import 'widgets/feed_widget.dart';

// NEW: stateless widget 으로 구성하면 계속 Offstage 를 써도 계속 반복해서 위젯을 생성하는 현상 발생
// 따라서, StatefulWidget 으로 전환한 후 const 로 생성할 수 있도록 변경
// TODO: 왜 const 로 구성하지 않으면 계속 rebuild 될까?
class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          toolbarHeight: Sizes.size64,
          title: FaIcon(
            FontAwesomeIcons.threads,
            size: Sizes.size44,
          ),
        ),
        ref.watch(timelineFeedViewModel).isLoading
            ? const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              )
            : SliverList(
                // NEW: ListView.builder 대체 가능, TODO: sliver 란?
                delegate: SliverChildBuilderDelegate(
                  childCount: ref.watch(timelineFeedViewModel).value!.length,
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FeedWidget(
                          feed: ref
                              .watch(timelineFeedViewModel)
                              .value!
                              .elementAt(index)),
                      const Divider(
                        thickness: 0.2,
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
