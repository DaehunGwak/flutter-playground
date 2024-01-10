import 'dart:async';

import 'package:flutter/material.dart';

class ExplicitAnimationScreen extends StatefulWidget {
  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() =>
      _ExplicitAnimationScreenState();
}

/// ticker? Frame 당 call 되는 함수
/// SingleTickerProviderStateMixin : 현재 트리가 활성화 되어 있는 동안만 ticker 제공
/// TickerProviderStateMixin: 여러 ticker 가 필요할 때 사용
/// 왜 ticker 가 필요한가? 애니메이션은 ticker 를 필요로 함 > 부드러운 모션을 연출하기 위해
class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  );

  void _play() {
    _animationController.forward();
  }

  void _pause() {
    _animationController.stop();
  }

  void _rewind() {
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        debugPrint(_animationController.value.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_animationController.value}',
              style: const TextStyle(
                fontSize: 58,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _play,
                  child: const Text('play'),
                ),
                ElevatedButton(
                  onPressed: _pause,
                  child: const Text('pause'),
                ),
                ElevatedButton(
                  onPressed: _rewind,
                  child: const Text('rewind'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
