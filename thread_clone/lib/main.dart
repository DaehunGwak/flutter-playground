import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread_clone/router.dart';
import 'package:thread_clone/settings/repositories/setting_repository.dart';
import 'package:thread_clone/settings/view_models/setting_view_model.dart';

void main() async {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final repository = SettingFileRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingViewModel(repository),
        ),
      ],
      child: const ThreadCloneApp(),
    ),
  );
}

class ThreadCloneApp extends StatelessWidget {
  const ThreadCloneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Threads Clone',
      themeMode: context.watch<SettingViewModel>().isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          brightness: Brightness.light,
          background: Colors.white,
          onBackground: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          modalBarrierColor: Colors.black.withOpacity(0.5),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          brightness: Brightness.dark,
          background: Colors.black,
          onBackground: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          modalBarrierColor: Colors.white.withOpacity(0.1),
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
