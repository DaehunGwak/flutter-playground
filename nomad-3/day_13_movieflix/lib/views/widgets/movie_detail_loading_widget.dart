import 'package:flutter/material.dart';

class MovieDetailLoadingWidget extends StatelessWidget {
  const MovieDetailLoadingWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(),
        ),
        Expanded(
          flex: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            constraints: const BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
