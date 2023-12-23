import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/log_in_screen.dart';
import 'package:tiktok_clone/features/authentication/repositories/auth_repository.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/main/navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/user/user_profile_screen.dart';
import 'package:tiktok_clone/features/video/video_recording_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/home",
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        debugPrint(
          "isLoggedIn: $isLoggedIn, state.matchedLocation: ${state.matchedLocation}",
        );
        if ((!isLoggedIn) &&
            (!state.matchedLocation.startsWith(SignUpScreen.routeUrl)) &&
            (!state.matchedLocation.startsWith(LogInScreen.routeUrl))) {
          debugPrint("redirect: SignUpScreen.routeUrl");
          return SignUpScreen.routeUrl;
        }
        debugPrint("redirect: null");
        return null;
      },
      routes: [
        GoRoute(
          name: SignUpScreen.routeName,
          path: SignUpScreen.routeUrl,
          builder: (context, state) => const SignUpScreen(),
          routes: [
            GoRoute(
              name: UsernameScreen.routeName,
              path: UsernameScreen.routeUrl,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: const UsernameScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                    );
                  },
                );
              },
            ),
            GoRoute(
              name: EmailScreen.routeName,
              path: EmailScreen.routeUrl,
              builder: (context, state) {
                final username = (state.extra ?? '') as String;
                return EmailScreen(
                  username: username,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: LogInScreen.routeUrl,
          builder: (context, state) => const LogInScreen(),
        ),
        GoRoute(
          path: '/users/:username',
          builder: (context, state) {
            print(state.pathParameters);
            final username = state.pathParameters['username'];
            final tab = state.uri.queryParameters['show'] ?? '';
            return UserProfileScreen(
              username: username!,
              tab: tab,
            );
          },
        ),
        GoRoute(
          path: "/video",
          builder: (context, state) => const VideoRecordingScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const MainNavigationScreen(),
        ),
      ],
    );
  },
);
