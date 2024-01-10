import 'package:flutter/material.dart';

class ChallengeImplicitAnimationScreen extends StatefulWidget {
  const ChallengeImplicitAnimationScreen({super.key});

  @override
  State<ChallengeImplicitAnimationScreen> createState() =>
      _ChallengeImplicitAnimationScreenState();
}

class _ChallengeImplicitAnimationScreenState
    extends State<ChallengeImplicitAnimationScreen> {
  bool _isGoRight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isGoRight ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: _isGoRight ? Colors.black : Colors.white,
        elevation: 0,
        title: Text(
          'Implicit Animation',
          style: TextStyle(
            color: _isGoRight ? Colors.white : Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 36,
          icon: Icon(
            Icons.chevron_left,
            color: _isGoRight ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(_isGoRight ? 0 : 365),
              ),
            ),
            TweenAnimationBuilder(
              tween: _isGoRight
                  ? Tween(
                      begin: 0.0,
                      end: 190.0,
                    )
                  : Tween(
                      begin: 190.0,
                      end: 0.0,
                    ),
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: Container(
                    width: 10,
                    height: 200,
                    color: _isGoRight ? Colors.white : Colors.black,
                  ),
                );
              },
              onEnd: () {
                setState(() {
                  _isGoRight = !_isGoRight;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
