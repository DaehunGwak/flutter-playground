import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class ProfileTabSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: TabBar(
        labelPadding: const EdgeInsets.symmetric(vertical: Sizes.size14),
        labelStyle: const TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w600,
        ),
        labelColor: Theme.of(context).colorScheme.onBackground,
        unselectedLabelColor: Colors.grey.shade600,
        indicatorColor: Theme.of(context).colorScheme.onBackground,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 1.0,
        splashFactory: NoSplash.splashFactory,
        tabs: const [
          Text('Threads'),
          Text('Replies'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => Sizes.size48;

  @override
  double get minExtent => Sizes.size48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
