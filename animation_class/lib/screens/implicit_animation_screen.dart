import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  bool _visible = true;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              duration: const Duration(seconds: 2),
              turns: _visible ? 0 : 0.25,
              curve: Curves.elasticOut,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: _visible ? size.width : size.width * 0.8,
                height: _visible ? size.width : size.width * 0.8,
                decoration: BoxDecoration(
                  color: _visible ? Colors.redAccent : Colors.amber,
                  borderRadius: BorderRadius.circular(_visible ? 100 : 0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _trigger,
              child: const Text('Go!'),
            ),
          ],
        ),
      ),
    );
  }
}
