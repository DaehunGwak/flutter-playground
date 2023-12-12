import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Column(
        children: [
          CupertinoActivityIndicator(
            radius: 40,
          ), // ios style loading indicator
          CircularProgressIndicator(), // android style loading indicator
          CircularProgressIndicator.adaptive(), // 플랫폼에 따라 바뀌는 loading indicator
        ],
      ),
      // body: ListWheelScrollView(
      //   diameterRatio: 1.5, // 휠 펴지는 정도
      //   offAxisFraction: 2,
      //   // useMagnifier: true, // 중앙 돋보기
      //   // magnification: 1.5, // 중앙 돋보기 배율
      //   itemExtent: 200, // item 높이
      //   children: [
      //     for (var x in [1, 2, 1, 1, 1, 1, 1, 1, 1])
      //       FractionallySizedBox(
      //         widthFactor: 1.0,
      //         child: Container(
      //           color: Colors.teal,
      //           alignment: Alignment.center,
      //           child: const Text(
      //             'Pick me',
      //             style: TextStyle(
      //               fontSize: Sizes.size32,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //   ],
      // ),
      // body: const Column(
      //   children: [
      //     // CloseButton() // NEW
      //   ],
      // ),
    );
  }
}
