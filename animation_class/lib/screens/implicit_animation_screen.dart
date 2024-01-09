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
            TweenAnimationBuilder(
              // tween: Tween(begin: 10.0, end: 20.0),
              tween: ColorTween(
                begin: Colors.blue,
                end: Colors.red,
              ),
              duration: const Duration(seconds: 10),
              curve: Curves.bounceInOut,
              builder: (context, value, child) {
                return Image.network(
                  "https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png",
                  color: value,
                  colorBlendMode: BlendMode.difference,
                );
              },
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
