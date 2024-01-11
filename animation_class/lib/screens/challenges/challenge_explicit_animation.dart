import 'package:flutter/material.dart';

class ChallengeExplicitAnimationScreen extends StatefulWidget {
  const ChallengeExplicitAnimationScreen({super.key});

  @override
  State<ChallengeExplicitAnimationScreen> createState() =>
      _ChallengeExplicitAnimationScreenState();
}

class _ChallengeExplicitAnimationScreenState
    extends State<ChallengeExplicitAnimationScreen>
    with TickerProviderStateMixin {
  static const int _ySize = 5;
  static const int _xSize = 5;

  late final _animationControllers = [
    for (int y = 0; y < _ySize; y++)
      [
        for (int x = 0; x < _xSize; x++)
          AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 1000),
          ),
      ],
  ];

  late final _curves = [
    for (int y = 0; y < _ySize; y++)
      [
        for (int x = 0; x < _xSize; x++)
          CurvedAnimation(
            parent: _animationControllers[y][x],
            curve: Curves.bounceInOut,
          ),
      ],
  ];

  late final _decorationAnimations = [
    for (int y = 0; y < _ySize; y++)
      [
        for (int x = 0; x < _xSize; x++)
          DecorationTween(
            begin: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0),
              borderRadius: BorderRadius.circular(0),
            ),
            end: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(3),
            ),
          ).animate(_curves[y][x]),
      ],
  ];

  late final _scaleAnimations = [
    for (int y = 0; y < _ySize; y++)
      [
        for (int x = 0; x < _xSize; x++)
          Tween(
            begin: 1.0,
            end: 1.1,
          ).animate(_curves[y][x]),
      ],
  ];

  Future<void> _startAnimation() async {
    bool isGoRight = false;
    int nowY = _ySize - 1;
    int nowX = _xSize - 1;

    while (nowX >= 0 && nowY >= 0) {
      _animationControllers[nowY][nowX].repeat(reverse: true);
      await Future.delayed(
        const Duration(milliseconds: 40),
      );
      if ((isGoRight && nowX >= (_xSize - 1)) || (!isGoRight && nowX <= 0)) {
        isGoRight = !isGoRight;
        nowY--;
        continue;
      }
      nowX += isGoRight ? 1 : -1;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _startAnimation(),
    );
  }

  @override
  void dispose() {
    for (var controllers in _animationControllers) {
      for (var controller in controllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int y = 0; y < _ySize; y++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int x = 0; x < _xSize; x++)
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ScaleTransition(
                        scale: _scaleAnimations[y][x],
                        child: DecoratedBoxTransition(
                          decoration: _decorationAnimations[y][x],
                          child: const SizedBox(
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
