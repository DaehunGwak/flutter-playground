import 'package:animation_music_player/models/movie_model.dart';
import 'package:flutter/material.dart';

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

class _MusicPlayerDetailScreenState extends State<MusicPlayerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.track.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTrackImage(),
            const SizedBox(
              height: 50,
            ),
            _buildProgressBar(),
          ],
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

  Widget _buildProgressBar() {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      size: Size(
        size.width - 80,
        5,
      ),
      painter: ProgressBarPainter(
        progressValue: 180,
      ),
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  ProgressBarPainter({required this.progressValue});

  final double progressValue;

  @override
  void paint(Canvas canvas, Size size) {
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
      progressValue,
      size.height,
      const Radius.circular(10),
    );
    canvas.drawRRect(progressBarRRect, progressBarPaint);

    // progress thumb
    final thumbPaint = Paint()
      ..color = Colors.grey.shade500
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(progressValue, size.height / 2),
      10,
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
