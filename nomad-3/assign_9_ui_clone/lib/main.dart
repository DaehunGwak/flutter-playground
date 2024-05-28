import 'package:assign_9_ui_clone/views/pages/home_page.dart';
import 'package:assign_9_ui_clone/views/shared/color_scheme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Schedule Clone",
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
        appBarTheme: darkAppBarTheme,
      ),
      home: const HomePage(),
    );
  }
}
