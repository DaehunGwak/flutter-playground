import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/user/user_profile_screen.dart';
import 'package:tiktok_clone/features/video/video_recording_screen.dart';

import 'features/authentication/email_screen.dart';
import 'features/authentication/log_in_screen.dart';
import 'features/authentication/sign_up_screen.dart';
import 'features/authentication/username_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LogInScreen.routeName,
      builder: (context, state) => const LogInScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    ),
    GoRoute(
      path: '/users/:username',
      builder: (context, state) {
        print(state.pathParameters);
        final username = state.pathParameters['username'];
        return UserProfileScreen(username: username!);
      },
    ),
    GoRoute(
      path: "/video",
      builder: (context, state) => const VideoRecordingScreen(),
    ),
  ],
);
