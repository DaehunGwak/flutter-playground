import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/auth/repositories/firebase_auth_repository.dart';
import 'package:thread_clone/auth/views/login_screen.dart';
import 'package:thread_clone/auth/views/signup_screen.dart';
import 'package:thread_clone/models/screen_type.dart';

import 'navigation/main_navigation_screen.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: MainNavigationScreen.routeUrl,
    redirect: (context, state) {
      final isLoggedIn = ref.read(firebaseAuthRepoProvider).isLoggedIn;
      debugPrint(
        "isLoggedIn: $isLoggedIn, state.matchedLocation: ${state.matchedLocation}",
      );
      if ((!isLoggedIn) &&
          (!state.matchedLocation.startsWith(LoginScreen.routeUrl)) &&
          (!state.matchedLocation.startsWith(SignUpScreen.routeUrl))) {
        debugPrint("redirect: SignUpScreen.routeUrl");
        return LoginScreen.routeUrl;
      }
      debugPrint("redirect: null");
      return null;
    },
    routes: [
      GoRoute(
        path: LoginScreen.routeUrl,
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: SignUpScreen.routeUrl,
        name: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
      ),
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
  ),
);
