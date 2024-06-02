import 'package:day_13_movieflix/views/shared/themes.dart';
import 'package:flutter/material.dart';

import 'views/pages/home_page.dart';

void main() {
  runApp(const MovieflixApp());
}

class MovieflixApp extends StatelessWidget {
  const MovieflixApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movieflix',
      theme: Themes.light,
      home: const HomePage(),
    );
  }
}
