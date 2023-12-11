import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // snap: true,
          // 조금이라도 업스크롤 시, appbar 가 나타남
          // floating: true,
          // 업스크롤 시, appbar 가 나타남
          // pinned: true,
          // 업스크롤 시, appbar 사라지지 않고 작아진채로 고정
          stretch: true,
          // 다운 스크롤 하면 appbar 늘어남
          backgroundColor: Colors.teal,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              'assets/images/bg1.jpg',
              fit: BoxFit.cover,
            ),
            title: const Text('Hello!'),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: Sizes.size20,
              ),
            ],
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 100, // 각 아이템 크기
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.amber[100 * (index % 9)],
              child: Center(child: Text("Item $index")),
            ),
          ),
        ),
        SliverPersistentHeader(
          delegate: CustomDelegate(),
          pinned: true,
          floating: true
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.amber[100 * (index % 9)],
              child: Center(child: Text("Item $index")),
            ),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: Sizes.size20,
            crossAxisSpacing: Sizes.size20,
            childAspectRatio: 1,
          ),
        ),
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: const FractionallySizedBox(
        heightFactor: 1.0,
        child: Center(
          child: Text(
            'sliver persistent header',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // maxheight
  @override
  double get maxExtent => 100;

  // minheight
  @override
  double get minExtent => 50;

  //
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
