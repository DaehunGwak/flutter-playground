import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        automaticallyImplyLeading: false, // NEW: `<` 버튼 삭제
        title: const Text("22796 comments"),
        actions: [
          IconButton(
            onPressed: _onClosePressed,
            icon: const FaIcon(FontAwesomeIcons.xmark),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (context, index) {
          return Text('i am a comment');
        },
      ),
    );
  }
}
