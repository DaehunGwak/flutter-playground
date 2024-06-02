import 'package:day_13_movieflix/config/isar.dart';

import '../models/movie_like.dart';

abstract class MovieLikeRepository {
  static void toggle(int movieId) {
    IsarConfig.instance.writeTxnSync(() {
      final like = IsarConfig.instance.movieLikes.getSync(movieId);

      if (like == null) {
        final movieLike = MovieLike.create(movieId: movieId);
        IsarConfig.instance.movieLikes.putSync(movieLike);
        return;
      }

      IsarConfig.instance.movieLikes.deleteSync(movieId);
    });
  }

  static Stream<MovieLike?> watch(int movieId) async* {
    yield* IsarConfig.instance.movieLikes.watchObject(
      movieId,
      fireImmediately: true,
    );
  }
}
