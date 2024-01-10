import 'package:animation_class/screens/challenges/challenge_implicit_animation.dart';
import 'package:animation_class/screens/courses/explicit_animation_screen.dart';
import 'package:animation_class/screens/courses/implicit_animation_screen.dart';
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
