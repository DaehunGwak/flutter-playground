import 'package:ch2_get_it/get_it/models.dart';
import 'package:flutter/material.dart';

import 'get_it/get_it_counter_screen.dart';

void main() {
  setUpGetItModels();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetItCounterScreen(),
    );
  }
}
