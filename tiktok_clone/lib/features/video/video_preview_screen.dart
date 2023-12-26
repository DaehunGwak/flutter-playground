import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gal/gal.dart';
import 'package:tiktok_clone/features/video/view_models/upload_video_view_model.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends ConsumerStatefulWidget {
  const VideoPreviewScreen({
    super.key,
    required this.video,
    required this.isPicked,
  });

  final XFile video;
  final bool isPicked;

  @override
  ConsumerState<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends ConsumerState<VideoPreviewScreen> {
  late final VideoPlayerController _videoPlayerController;

  bool _isSaved = false;

  Future<void> _saveVideoToGallery() async {
    if (_isSaved) return;

    Gal.putVideo(
      widget.video.path,
      album: 'Tiktok Clone',
    );

    setState(() {
      _isSaved = true;
    });
  }

  Future<void> _initVideo() async {
    _videoPlayerController =
        VideoPlayerController.file(File(widget.video.path));

    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
    setState(() {});
  }

  Future<void> _uploadVideo() async {
    ref.read(uploadVideoProvider.notifier).uploadVideo(
          File(widget.video.path),
          context,
        );
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview video'),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _saveVideoToGallery,
              icon: FaIcon(
                _isSaved ? FontAwesomeIcons.check : FontAwesomeIcons.download,
              ),
            ),
          IconButton(
            onPressed:
                ref.watch(uploadVideoProvider).isLoading ? () {} : _uploadVideo,
            icon: ref.watch(uploadVideoProvider).isLoading
                ? const CircularProgressIndicator.adaptive()
                : const FaIcon(FontAwesomeIcons.cloudArrowUp),
            enableFeedback: true,
          ),
        ],
      ),
      body: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : null,
    );
  }
}
