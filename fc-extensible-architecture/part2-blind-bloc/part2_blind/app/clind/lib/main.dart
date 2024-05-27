import 'package:clind/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tool_clind_theme/theme.dart';

Future<void> main() async {
  runApp(const ClindApp());
}

class ClindApp extends StatelessWidget {
  const ClindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClindTheme(
      themeData: ClindThemeData.dark(),
      child: const MaterialApp(
        themeMode: ThemeMode.dark,
        localizationsDelegates: [
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: [
          Locale('ko'),
        ],
        home: HomeScreen(),
      ),
    );
  }
}
