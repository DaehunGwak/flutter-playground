import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main/home/view_models/playback_config_vm.dart';

import 'features/main/home/repositories/playback_config_repository.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final repository = PlaybackConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        playbackConfigProvider.overrideWith(
          () => PlaybackConfigViewModel(repository),
        ),
      ],
      child: const TikTokApp(),
    ),
  );
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        // NEW
        splashColor: Colors.transparent,
        // NEW: 터치 시 스플래시 애니메이션 off
        highlightColor: Colors.transparent,
        // NEW: 터치 시 하이라이트 애니메이션 off
        appBarTheme: const AppBarTheme(
          // NEW
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color(0xFFE9435A),
          background: Colors.white,
          primary: const Color(0xFFE9435A),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          // NEW: 전체 text input 테마에 적용
          cursorColor: Color(0xFFE9435A),
        ),
      ),
      // home: SignUpScreen(),
      // home: InterestsScreen(),
      // home: const MainNavigationScreen(),
      // home: const ActivityScreen(),
      routerConfig: router,
    );
  }
}
