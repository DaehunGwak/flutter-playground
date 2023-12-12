import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class ProfileButtonSliverBox extends StatelessWidget {
  const ProfileButtonSliverBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: Sizes.size8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: const Text(
                  'Edit profile',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Gaps.h12,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: Sizes.size8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: const Text(
                  'Share profile',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
