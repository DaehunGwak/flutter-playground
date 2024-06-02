import 'package:day_13_movieflix/repositories/movie_api_repository.dart';
import 'package:day_13_movieflix/views/widgets/movie_detail_meta_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/hero_tag_builder.dart';
import '../widgets/movie_detail_loading_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.middleTag,
  });

  final int id;
  final String title;
  final String imageUrl;
  final String middleTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Back to list',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.surface),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.surface,
        ),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Hero(
            tag: HeroTagBuilder.buildImageTag(middleTag, id),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(imageUrl),
                ),
              ),
              foregroundDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
            ),
          ),
          FutureBuilder(
            future: MovieApiRepository.getDetailMovie(id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return MovieDetailLoadingWidget(title: title);
              }
              return MovieDetailMetaWidget(movie: snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
