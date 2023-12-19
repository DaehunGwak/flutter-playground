import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/router.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const ThreadCloneApp());
}

class ThreadCloneApp extends StatelessWidget {
  const ThreadCloneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Threads Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          background: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
