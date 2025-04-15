import 'package:flutter/material.dart';

import '../../cubit/bottom_nav_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    required this.nav,
  });

  final BottomNav nav;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      color: Theme.of(context).colorScheme.primary,
      child: AppBar(
        title: Text(
          nav.toName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
    );
  }
}
