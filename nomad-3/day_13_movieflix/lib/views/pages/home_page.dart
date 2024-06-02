import 'package:flutter/material.dart';

import '../../repositories/movie_api_repository.dart';
import '../widgets/movie_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            MovieCardWidget(
              movieApiFuture: MovieApiRepository.getPopularMovies(),
              title: "인기 작품",
              imageHeight: 220,
              imageWidth: 320,
              isDisplayTitle: false,
            ),
            MovieCardWidget(
              movieApiFuture: MovieApiRepository.getNowPlayingMovies(),
              title: "상영작",
              imageHeight: 150,
              imageWidth: 150,
              isDisplayTitle: true,
            ),
            MovieCardWidget(
              movieApiFuture: MovieApiRepository.getComingSoonMovies(),
              title: "개봉 예정작",
              imageHeight: 150,
              imageWidth: 150,
              isDisplayTitle: true,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
