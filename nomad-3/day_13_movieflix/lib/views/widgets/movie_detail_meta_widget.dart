import 'package:flutter/material.dart';

import '../../models/movie_meta.dart';
import '../entities/star_filled_icon.dart';

class MovieDetailMetaWidget extends StatelessWidget {
  const MovieDetailMetaWidget({
    super.key,
    required this.movie,
  });

  final DetailMovie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(),
        ),
        Expanded(
          flex: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                Row(
                  children: [
                    for (double i = 0; i < 10; i += 2)
                      StarFilledIcon(
                        ratio: (movie.voteAverage - i) / 2.0,
                      ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  '${movie.formattedRuntime} | ${movie.formattedGenres}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  '스토리',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: 60,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF8D849),
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    child: const Text('Buy Ticket'),
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ],
    );
  }
}
