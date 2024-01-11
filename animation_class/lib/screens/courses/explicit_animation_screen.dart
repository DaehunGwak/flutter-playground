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
    duration: const Duration(seconds: 2),
    reverseDuration: const Duration(seconds: 1),
  )
    ..addListener(
      () {
        _valueNotifier.value = _animationController.value;
      },
    )
    ..addStatusListener(
      (status) {
        debugPrint(status.toString());
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      },
    );

  late final Animation<Decoration> _decoration = DecorationTween(
    begin: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(20),
    ),
    end: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(120),
    ),
  ).animate(_animationController);

  late final CurvedAnimation _curved = CurvedAnimation(
    parent: _animationController,
    curve: Curves.elasticOut,
    reverseCurve: Curves.easeIn,
  );

  late final Animation<double> _rotation = Tween(
    begin: 0.0,
    end: 0.13,
  ).animate(_curved);

  late final Animation<double> _scale = Tween(
    begin: 1.0,
    end: 0.8,
  ).animate(_curved);

  late final Animation<Offset> _offset = Tween(
    begin: Offset.zero,
    end: const Offset(0.1, 0.1),
  ).animate(_curved);

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  void _onChanged(double value) {
    _animationController.value = value;
  }

  void _repeat() {
    _animationController.repeat(reverse: true);
  }

  void _forward() {
    _animationController.forward();
  }

  void _stop() {
    _animationController.stop();
  }

  void _reverse() {
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            SlideTransition(
              position: _offset,
              child: ScaleTransition(
                scale: _scale,
                child: RotationTransition(
                  turns: _rotation,
                  child: DecoratedBoxTransition(
                    decoration: _decoration,
                    child: const SizedBox(
                      height: 400,
                      width: 400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _repeat,
                  child: const Text('repeat'),
                ),
                ElevatedButton(
                  onPressed: _forward,
                  child: const Text('forward'),
                ),
                ElevatedButton(
                  onPressed: _stop,
                  child: const Text('stop'),
                ),
                ElevatedButton(
                  onPressed: _reverse,
                  child: const Text('reverse'),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (context, value, child) {
                return Slider(
                  value: value,
                  onChanged: _onChanged,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
