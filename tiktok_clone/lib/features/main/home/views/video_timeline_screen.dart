import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/main/home/view_models/timeline_view_model.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  ConsumerState createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            ref.read(timelineProvider.notifier).uploadVideo();
          },
          icon: const FaIcon(FontAwesomeIcons.upload),
        ),
        ref.watch(timelineProvider).when(
              data: (videos) => Column(
                children: [
                  for (var video in videos) Text(video.title),
                ],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => Center(child: Text('Could not load videos: $e')),
            ),
      ],
    );
  }
}
