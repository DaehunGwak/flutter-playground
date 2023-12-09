import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All activity'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        children: [
          Gaps.v14,
          Text(
            'New',
            style: TextStyle(
              fontSize: Sizes.size14,
              color: Colors.grey.shade500,
            ),
          ),
          Gaps.v14,
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              width: Sizes.size52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: Sizes.size1,
                ),
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.bell,
                  color: Colors.black,
                ),
              ),
            ),
            title: RichText(
              text: TextSpan(
                text: 'Account Updates:',
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(
                    text: ' Upload longer videos',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: ' 1h',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
            ),
          ),
        ],
      ),
    );
  }
}
