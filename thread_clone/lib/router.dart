import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/models/screen_type.dart';

import 'navigation/main_navigation_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: MainNavigationScreen.routeUrl,
      builder: (context, state) {
        return const MainNavigationScreen();
      },
    ),
    GoRoute(
        path: '/settings/privacy',
        builder: (context, state) {
          return const MainNavigationScreen(
            startScreenType: ScreenType.settingsPrivacy,
          );
        }),
    GoRoute(
      path: '${MainNavigationScreen.routeUrl}:screenName',
      builder: (context, state) {
        final screenName = state.pathParameters['screenName'] ?? 'home';
        debugPrint('screenName: $screenName');
        try {
          final screenType = ScreenType.values.byName(screenName);
          return MainNavigationScreen(startScreenType: screenType);
        } catch (e) {
          debugPrint('not found screenName: $screenName, exception: $e');
          return const MainNavigationScreen();
        }
      },
    ),
  ],
);
