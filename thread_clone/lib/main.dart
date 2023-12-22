import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    ProviderScope(
      overrides: [
        settingProvider.overrideWith(
          () => SettingViewModel(repository),
        ),
      ],
      child: const ThreadCloneApp(),
    ),
  );
}

class ThreadCloneApp extends ConsumerWidget {
  const ThreadCloneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Threads Clone',
      themeMode: ref.watch(settingProvider).isDarkMode
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
