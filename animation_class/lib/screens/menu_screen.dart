import 'package:animation_class/screens/challenges/challenge_explicit_animation.dart';
import 'package:animation_class/screens/challenges/challenge_implicit_animation.dart';
import 'package:animation_class/screens/courses/apple_watch_screen.dart';
import 'package:animation_class/screens/courses/explicit_animation_screen.dart';
import 'package:animation_class/screens/courses/implicit_animation_screen.dart';
import 'package:animation_class/screens/courses/swiping_cards_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animations'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Divider(),
              const Text(
                "Course Examples",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                onPressed: () => _pushScreen(
                  context,
                  const ImplicitAnimationScreen(),
                ),
                child: const Text('Implicit Animations'),
              ),
              ElevatedButton(
                onPressed: () => _pushScreen(
                  context,
                  const ExplicitAnimationScreen(),
                ),
                child: const Text('Explicit Animations'),
              ),
              ElevatedButton(
                onPressed: () => _pushScreen(
                  context,
                  const AppleWatchScreen(),
                ),
                child: const Text('Apple Watch (CustomPainter)'),
              ),
              ElevatedButton(
                onPressed: () => _pushScreen(
                  context,
                  const SwipingCardsScreen(),
                ),
                child: const Text('Swiping Cards'),
              ),
              const Divider(),
              const Text(
                "Challenges",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                onPressed: () => _pushScreen(
                  context,
                  const ChallengeImplicitAnimationScreen(),
                ),
                child: const Text('Implicit Animation'),
              ),
              ElevatedButton(
                onPressed: () => _pushScreen(
                  context,
                  const ChallengeExplicitAnimationScreen(),
                ),
                child: const Text('Explicit Animation'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _pushScreen(BuildContext context, Widget widget) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
