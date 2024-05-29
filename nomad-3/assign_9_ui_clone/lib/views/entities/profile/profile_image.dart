import 'package:assign_9_ui_clone/views/shared/sizes.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: Sizes.size52,
      height: Sizes.size52,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset("assets/images/profile.png"),
    );
  }
}
