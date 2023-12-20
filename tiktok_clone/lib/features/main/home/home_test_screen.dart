import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_notifier_config.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main/home/widgets/video_comments.dart';

class HomeTestScreen extends StatefulWidget {
  const HomeTestScreen({super.key});

  @override
  State<HomeTestScreen> createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends State<HomeTestScreen> {
  bool _autoMute = videoValueNotifierConfig.value;

  void _onCommentsTap(BuildContext context) async {
    await showModalBottomSheet(
      // NEW: bottom sheet 띄우는 법
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // NEW: container 적용이 안되어 찾아봄
        // https://www.flutterbeads.com/bottom-sheet-with-rounded-corners-in-flutter/
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Sizes.size16),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      // barrierColor: Colors.green.withOpacity(0.5), // NEW: 시트 아닌 영역의 색
      builder: (context) => const VideoComments(),
    );
    debugPrint('bottom sheet closed');
  }

  @override
  void initState() {
    super.initState();

    videoValueNotifierConfig.addListener(() {
      setState(() {
        _autoMute = videoValueNotifierConfig.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              for (var i = 0; i < 4; i++)
                const Text(
                  '🫠',
                  style: TextStyle(fontSize: 40),
                ),
              IconButton(
                onPressed: () => _onCommentsTap(context),
                icon: const FaIcon(FontAwesomeIcons.comment),
              ),
              IconButton(
                onPressed: () {
                  videoValueNotifierConfig.value =
                      !videoValueNotifierConfig.value;
                },
                icon: FaIcon(
                  _autoMute
                      ? FontAwesomeIcons.volumeOff
                      : FontAwesomeIcons.volumeHigh,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
