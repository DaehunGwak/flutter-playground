import 'package:animation_music_player/models/track_model.dart';
import 'package:animation_music_player/utils/string_format.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MusicPlayerDetailScreen extends StatefulWidget {
  const MusicPlayerDetailScreen({
    super.key,
    required this.track,
  });

  final TrackModel track;

  @override
  State<MusicPlayerDetailScreen> createState() =>
      _MusicPlayerDetailScreenState();
}

class _MusicPlayerDetailScreenState extends State<MusicPlayerDetailScreen>
    with TickerProviderStateMixin {
  late final size = MediaQuery.of(context).size;

  late final AnimationController _progressController = AnimationController(
    vsync: this,
    duration: widget.track.runtime,
  )..repeat(reverse: true);

  late final AnimationController _marqueeController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  );

  late final Animation<Offset> _marqueeTween = Tween(
    begin: const Offset(0, 0),
    end: const Offset(-0.5, 0),
  ).animate(_marqueeController);

  late final AnimationController _playPauseLottieController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..forward();

  late final AnimationController _menuController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );

  late final Curve _menuCurve = Curves.easeInOutCubic;

  late final Animation<double> _screenScale = Tween(
    begin: 1.0,
    end: 0.7,
  ).animate(
    CurvedAnimation(
      parent: _menuController,
      curve: Interval(
        0.0,
        0.3,
        curve: _menuCurve,
      ),
    ),
  );

  late final Animation<Offset> _screenOffset = Tween(
    begin: Offset.zero,
    end: const Offset(0.5, 0),
  ).animate(
    CurvedAnimation(
      parent: _menuController,
      curve: Interval(
        0.2,
        0.4,
        curve: _menuCurve,
      ),
    ),
  );

  late final Animation<double> _closeButtonOpacity = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _menuController,
      curve: Interval(
        0.3,
        0.5,
        curve: _menuCurve,
      ),
    ),
  );

  late final Animation<Offset> _profileSlide = Tween(
    begin: const Offset(-1, 0),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _menuController,
      curve: Interval(
        0.4,
        0.6,
        curve: _menuCurve,
      ),
    ),
  );

  bool _dragging = false;

  final ValueNotifier<double> _volume = ValueNotifier(0);

  void _onPlayPauseLottieTap() {
    if (_playPauseLottieController.isCompleted) {
      _playPauseLottieController.reverse();
      return;
    }
    _playPauseLottieController.forward();
  }

  void _toggleDragging() {
    setState(() {
      _dragging = !_dragging;
    });
  }

  void _onVolumeDragUpdate(DragUpdateDetails details) {
    final result = _volume.value + details.delta.dx;
    _volume.value = result.clamp(0, size.width - 80);
  }

  void _openMenu() {
    _menuController.forward();
  }

  void _closeMenu() {
    _menuController.reverse();
  }

  @override
  void dispose() {
    _marqueeController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildMenu(),
        SlideTransition(
          position: _screenOffset,
          child: ScaleTransition(
            scale: _screenScale,
            child: _buildPlayer(),
          ),
        ),
      ],
    );
  }

  Scaffold _buildPlayer() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openMenu,
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTrackImage(),
              const SizedBox(
                height: 50,
              ),
              _buildProgress(),
              const SizedBox(
                height: 20,
              ),
              _buildTrackText(),
              const SizedBox(
                height: 25,
              ),
              _buildPlayButtonRow(),
              const SizedBox(
                height: 30,
              ),
              _buildVolumeBar(),
            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> _menus = [
    {
      "icon": Icons.person,
      "text": "Profile",
    },
    {
      "icon": Icons.notifications,
      "text": "Notifications",
    },
    {
      "icon": Icons.settings,
      "text": "Settings",
    },
  ];

  Scaffold _buildMenu() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: FadeTransition(
          opacity: _closeButtonOpacity,
          child: IconButton(
            onPressed: _closeMenu,
            icon: const Icon(Icons.close),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              for (var menu in _menus) ...[
                SlideTransition(
                  position: _profileSlide,
                  child: Row(
                    children: [
                      Icon(
                        menu["icon"],
                        color: Colors.grey.shade200,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        menu["text"],
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.red.shade400,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackImage() {
    return Hero(
      tag: widget.track.createTag(),
      child: Container(
        height: 350,
        width: 350,
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
            image: NetworkImage(widget.track.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildProgress() {
    return AnimatedBuilder(
      animation: _progressController,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              _buildProgressBar(size),
              const SizedBox(
                height: 8,
              ),
              _buildProgressTime(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgressBar(Size size) {
    return CustomPaint(
      size: Size(
        size.width - 80,
        5,
      ),
      painter: ProgressBarPainter(
        progress: _progressController.value,
      ),
    );
  }

  Widget _buildProgressTime() {
    final nowRuntime = widget.track.runtime * _progressController.value;
    final lastedRuntime = widget.track.runtime - nowRuntime;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          formattedTime(nowRuntime),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
          ),
        ),
        Text(
          formattedTime(lastedRuntime),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }

  Widget _buildTrackText() {
    if (widget.track.title.length > 23) {
      _marqueeController.repeat(reverse: true);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SlideTransition(
            position: _marqueeTween,
            child: Text(
              widget.track.title,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.track.artist,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildPlayButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // IconButton(
        //   onPressed: _onPlayPauseTap,
        //   icon: AnimatedIcon(
        //     icon: AnimatedIcons.pause_play,
        //     progress: _playPauseController,
        //     size: 60,
        //   ),
        // ),
        IconButton(
          onPressed: _onPlayPauseLottieTap,
          icon: LottieBuilder.asset(
            "assets/lottie/play-lottie.json",
            controller: _playPauseLottieController,
            onLoaded: (composition) {
              _playPauseLottieController.duration = composition.duration;
            },
            width: 60,
            height: 60,
          ),
        ),
      ],
    );
  }

  GestureDetector _buildVolumeBar() {
    return GestureDetector(
      onHorizontalDragStart: (_) => _toggleDragging(),
      onHorizontalDragEnd: (_) => _toggleDragging(),
      onHorizontalDragUpdate: _onVolumeDragUpdate,
      child: AnimatedScale(
        scale: _dragging ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: ValueListenableBuilder(
            valueListenable: _volume,
            builder: (context, value, child) => CustomPaint(
              size: Size(size.width - 80, 30),
              painter: VolumePainter(_volume.value),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  ProgressBarPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final progressWidth = size.width * progress;

    // background bar
    final backgroundBarPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;
    final backgroundRRect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      const Radius.circular(10),
    );
    canvas.drawRRect(backgroundRRect, backgroundBarPaint);

    // progress bar
    final progressBarPaint = Paint()
      ..color = Colors.grey.shade500
      ..style = PaintingStyle.fill;
    final progressBarRRect = RRect.fromLTRBR(
      0,
      0,
      progressWidth,
      size.height,
      const Radius.circular(10),
    );
    canvas.drawRRect(progressBarRRect, progressBarPaint);

    // progress thumb
    final thumbPaint = Paint()
      ..color = Colors.grey.shade500
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(progressWidth, size.height / 2),
      10,
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class VolumePainter extends CustomPainter {
  VolumePainter(this.volume);

  final double volume;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = Colors.grey.shade300;
    final backgroundRect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
    canvas.drawRect(backgroundRect, backgroundPaint);

    final volumePaint = Paint()..color = Colors.grey.shade500;
    final volumeRect = Rect.fromLTWH(
      0,
      0,
      volume.clamp(0, size.width),
      size.height,
    );
    canvas.drawRect(volumeRect, volumePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
