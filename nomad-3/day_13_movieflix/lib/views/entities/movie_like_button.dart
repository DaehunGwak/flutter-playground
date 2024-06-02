import 'package:day_13_movieflix/repositories/movie_like_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieLikeButton extends StatelessWidget {
  const MovieLikeButton({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onPressLike,
      icon: StreamBuilder(
        stream: MovieLikeRepository.watch(movieId),
        builder: (context, snapshot) {
          return Icon(
            snapshot.hasData ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            color: snapshot.hasData
                ? Colors.deepOrange
                : Theme.of(context).colorScheme.surface,
          );
        },
      ),
    );
  }

  void _onPressLike() {
    MovieLikeRepository.toggle(movieId);
  }
}
