import 'package:flutter/material.dart';

import '../../models/movie_meta.dart';
import '../../routes/routes.dart';
import '../../utils/hero_tag_builder.dart';

class MovieCardsFeature extends StatelessWidget {
  const MovieCardsFeature({
    super.key,
    required this.imageWidth,
    required this.imageHeight,
    required this.isDisplayTitle,
    required this.movies,
    required this.middleTag,
  });

  final double imageWidth;
  final double imageHeight;
  final bool isDisplayTitle;
  final List<SimpleMovie> movies;
  final String middleTag;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        // cache image
        precacheImage(Image.network(movies[index].imageBigUrl!).image, context);

        // widget
        return GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MovieflixRoutes.routeDetailPage(movies[index], middleTag),
            )
          },
          child: Container(
            width: imageWidth,
            decoration: const BoxDecoration(color: Colors.transparent),
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag:
                      HeroTagBuilder.buildImageTag(middleTag, movies[index].id),
                  child: Container(
                    width: imageWidth,
                    height: imageHeight,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network(
                      movies[index].imageUrl!,
                      height: imageHeight,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (isDisplayTitle)
                  Text(
                    movies[index].title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
