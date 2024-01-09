import 'package:animation_class/screens/implicit_animation_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animations'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _pushScreen(
                context,
                const ImplicitAnimationScreen(),
              ),
              child: const Text('Implicit Animations'),
            ),
          ],
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
