import 'dart:ui';

import 'package:animation_music_player/models/movie_model.dart';
import 'package:animation_music_player/screens/music_player_detail_screen.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  static List<TrackModel> tracks = MusicModelFactory.createMusics();

  final PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  final ValueNotifier<double> _scroll = ValueNotifier(0.0);

  int _currentPage = 0;

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  void _onTrackImageTap(int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: MusicPlayerDetailScreen(
              track: tracks[index],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page == null) {
        return;
      }
      _scroll.value = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildBackground(),
          _buildTrackWidgets(),
        ],
      ),
    );
  }

  AnimatedSwitcher _buildBackground() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Container(
        key: ValueKey("background-image-$_currentPage"),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(tracks[_currentPage].imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 25,
            sigmaY: 25,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  PageView _buildTrackWidgets() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemCount: tracks.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _scroll,
              builder: (context, value, child) {
                final difference = (value - index).abs();
                final scale = 1 - difference * 0.15;
                return Transform.scale(
                  scale: scale,
                  child: _buildTrackImage(index),
                );
              },
            ),
            _buildTrackText(index),
          ],
        );
      },
    );
  }

  Widget _buildTrackImage(int index) {
    return GestureDetector(
      onTap: () => _onTrackImageTap(index),
      child: Hero(
        tag: tracks[index].createTag(),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              )
            ],
            image: DecorationImage(
              image: NetworkImage(tracks[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrackText(int index) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          tracks[index].title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          tracks[index].artist,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
