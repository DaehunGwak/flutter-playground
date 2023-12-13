import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  bool _hasPermission = false;
  late final CameraController _cameraController;

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    print(cameras);

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras.first,
      ResolutionPreset.ultraHigh,
      imageFormatGroup: ImageFormatGroup.bgra8888,
    );

    await _cameraController.initialize();
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (cameraDenied || micDenied) {
      return;
    }
    setState(() {
      _hasPermission = true;
    });
    await initCamera();
  }

  @override
  void initState() {
    initPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: (_hasPermission && _cameraController.value.isInitialized)
            ? Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                ],
              )
            : _buildPermissionRequestLoading(),
      ),
    );
  }

  Center _buildPermissionRequestLoading() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Requesting permissions...",
            style: TextStyle(color: Colors.white),
          ),
          Gaps.v20,
          CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
            strokeWidth: Sizes.size20,
          ),
        ],
      ),
    );
  }
}
