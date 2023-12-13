import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import 'router.dart';

void main() {
  runApp(const TikTokApp());
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
