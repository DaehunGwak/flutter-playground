import 'package:flutter/material.dart';

class EmptyCardsFeature extends StatelessWidget {
  const EmptyCardsFeature({
    super.key,
    required this.imageWidth,
    required this.imageHeight,
    required this.isDisplayTitle,
  });

  final double imageWidth;
  final double imageHeight;
  final bool isDisplayTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                  ),
                  const SizedBox(height: 10),
                  if (isDisplayTitle)
                    Container(
                      width: imageWidth - 10,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.3),
                      ),
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
