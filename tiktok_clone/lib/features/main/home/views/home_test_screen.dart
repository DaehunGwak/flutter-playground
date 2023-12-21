import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main/home/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/features/main/home/views/widgets/video_comments.dart';

class HomeTestScreen extends StatefulWidget {
  const HomeTestScreen({super.key});

  @override
  State<HomeTestScreen> createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends State<HomeTestScreen> {
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
                  context.read<PlaybackConfigViewModel>().toggleMuted();
                },
                icon: FaIcon(
                  context.watch<PlaybackConfigViewModel>().muted
                      ? FontAwesomeIcons.volumeOff
                      : FontAwesomeIcons.volumeHigh,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<PlaybackConfigViewModel>().toggleAutoplay();
                },
                icon: FaIcon(
                  context.watch<PlaybackConfigViewModel>().autoplay
                      ? FontAwesomeIcons.play
                      : FontAwesomeIcons.stop,
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
