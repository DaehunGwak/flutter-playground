import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/models/mock/write_mock_data_util.dart';
import 'package:thread_clone/write/write_photo_screen.dart';

import 'widget/write_profile_column.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final username = WriteMockDataUtil.username();
  final profileImageUrl = WriteMockDataUtil.profileImageUrl();

  final TextEditingController _textEditingController = TextEditingController();

  bool _isPostActive = false;
  List<XFile> _xFiles = [];

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      final text = _textEditingController.value.text;
      debugPrint(text);
      if (text.isNotEmpty && _isPostActive == false) {
        setState(() {
          _isPostActive = true;
        });
      }
      if (text.isEmpty && _isPostActive == true) {
        setState(() {
          _isPostActive = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.9,
      color: Colors.white,
      clipBehavior: Clip.none,
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.size20),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          WriteProfileColumn(imageUrl: profileImageUrl),
                          Gaps.h14,
                          Expanded(child: _buildWriteContentsColumn()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _buildBottomPostBar(context, screenSize),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'New thread',
        style: TextStyle(fontSize: Sizes.size20, fontWeight: FontWeight.w700),
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: Sizes.size64,
      leadingWidth: Sizes.size96,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: Sizes.size3),
        child: TextButton(
          onPressed: _onCancelPressed,
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      shape: const Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
    );
  }

  void _onCancelPressed() {
    Navigator.of(context).pop();
  }

  Widget _buildBottomPostBar(BuildContext context, Size screenSize) {
    return Container(
      color: Colors.white,
      width: screenSize.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Anyone can reply',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              AnimatedOpacity(
                opacity: _isPostActive ? 1 : 0.4,
                duration: const Duration(milliseconds: 300),
                child: const Text(
                  'Post',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWriteContentsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size16,
          ),
        ),
        TextField(
          controller: _textEditingController,
          autofocus: true,
          textInputAction: TextInputAction.newline,
          maxLines: 100,
          minLines: 1,
          cursorColor: Colors.blue,
          style: const TextStyle(
            fontSize: Sizes.size16,
          ),
          decoration: const InputDecoration(
              hintText: 'Start a thread...',
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              )),
        ),
        Gaps.v20,
        if (_xFiles.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: [
                for (var xFile in _xFiles)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: Sizes.size12,
                      bottom: Sizes.size12,
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 190,
                        maxHeight: 190,
                      ),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(Sizes.size12),
                      ),
                      child: Stack(
                        children: [
                          Image.file(
                            File(xFile.path),
                          ),
                          Positioned(
                            top: Sizes.size5,
                            right: Sizes.size5,
                            child: GestureDetector(
                              onTap: () => setState(() {
                                _xFiles.remove(xFile);
                              }),
                              child: const Icon(
                                CupertinoIcons.xmark_circle_fill,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        GestureDetector(
          onTap: _pushPhotoScreen,
          child: const Icon(
            CupertinoIcons.paperclip,
            color: Colors.grey,
            size: Sizes.size24,
          ),
        ),
      ],
    );
  }

  Future<void> _pushPhotoScreen() async {
    final files = await Navigator.push(
      context,
      MaterialPageRoute<List<XFile>>(
        builder: (context) => const WritePhotoScreen(),
      ),
    );
    if (files == null || files.isEmpty) {
      return;
    }
    setState(() {
      _xFiles.addAll(files);
    });
  }
}
