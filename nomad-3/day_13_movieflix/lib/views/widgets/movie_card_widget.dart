import 'package:day_13_movieflix/views/features/empty_cards_feature.dart';
import 'package:day_13_movieflix/views/features/movie_cards_feature.dart';
import 'package:flutter/material.dart';

import '../../models/movie_meta.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.movieApiFuture,
    required this.title,
    required this.imageHeight,
    required this.imageWidth,
    this.isDisplayTitle = true,
  });

  final Future<List<SimpleMovie>> movieApiFuture;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final bool isDisplayTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: isDisplayTitle ? (imageHeight + 80) : (imageHeight + 10),
          child: FutureBuilder(
            future: movieApiFuture,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return EmptyCardsFeature(
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
                  isDisplayTitle: isDisplayTitle,
                );
              }
              return MovieCardsFeature(
                imageWidth: imageWidth,
                imageHeight: imageHeight,
                isDisplayTitle: isDisplayTitle,
                movies: snapshot.data!,
                middleTag: title,
              );
            },
          ),
        ),
      ],
    );
  }
}
