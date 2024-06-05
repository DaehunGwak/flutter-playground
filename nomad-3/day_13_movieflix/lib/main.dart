import 'package:day_13_movieflix/views/shared/themes.dart';
import 'package:flutter/material.dart';

import 'config/isar.dart';
import 'views/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarConfig.loadInstance();
  runApp(const MovieflixApp());
}

class MovieflixApp extends StatelessWidget {
  const MovieflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movieflix',
      theme: Themes.light,
      home: const HomePage(),
    );
  }
}
