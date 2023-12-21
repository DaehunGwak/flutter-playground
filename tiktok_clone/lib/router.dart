import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/main/navigation/main_navigation_screen.dart';

final router = GoRouter(
  routes: [
    // GoRoute(
    //   name: SignUpScreen.routeName,
    //   path: SignUpScreen.routeUrl,
    //   builder: (context, state) => const SignUpScreen(),
    //   routes: [
    //     GoRoute(
    //       name: UsernameScreen.routeName,
    //       path: UsernameScreen.routeUrl,
    //       pageBuilder: (context, state) {
    //         return CustomTransitionPage(
    //           child: const UsernameScreen(),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //             return FadeTransition(
    //               opacity: animation,
    //               child: ScaleTransition(
    //                 scale: animation,
    //                 child: child,
    //               ),
    //             );
    //           },
    //         );
    //       },
    //     ),
    //     GoRoute(
    //       name: EmailScreen.routeName,
    //       path: EmailScreen.routeUrl,
    //       builder: (context, state) {
    //         final username = (state.extra ?? '') as String;
    //         return EmailScreen(
    //           username: username,
    //         );
    //       },
    //     ),
    //   ],
    // ),
    // GoRoute(
    //   path: LogInScreen.routeName,
    //   builder: (context, state) => const LogInScreen(),
    // ),
    // GoRoute(
    //   path: '/users/:username',
    //   builder: (context, state) {
    //     print(state.pathParameters);
    //     final username = state.pathParameters['username'];
    //     final tab = state.uri.queryParameters['show'] ?? '';
    //     return UserProfileScreen(
    //       username: username!,
    //       tab: tab,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: "/video",
    //   builder: (context, state) => const VideoRecordingScreen(),
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) => const MainNavigationScreen(),
    ),
  ],
);
