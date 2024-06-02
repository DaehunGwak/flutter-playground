import 'package:isar/isar.dart';

part 'movie_like.g.dart';

@collection
class MovieLike {
  MovieLike({
    required this.movieId,
    required this.createdAt,
  });

  final Id movieId;
  final DateTime createdAt;

  factory MovieLike.create({required Id movieId}) {
    return MovieLike(
      movieId: movieId,
      createdAt: DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'MovieLike{movieId: $movieId, createdAt: $createdAt}';
  }
}
