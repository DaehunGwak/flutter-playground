import 'package:flutter/material.dart';

import '../models/movie_meta.dart';
import '../views/pages/detail_page.dart';

abstract class MovieflixRoutes {
  static PageRoute routeDetailPage(SimpleMovie movie, String middleTag) {
    return MaterialPageRoute(
      builder: (context) => DetailPage(
        id: movie.id,
        title: movie.title,
        imageUrl: movie.imageBigUrl!,
        middleTag: middleTag,
      ),
    );
  }
}
