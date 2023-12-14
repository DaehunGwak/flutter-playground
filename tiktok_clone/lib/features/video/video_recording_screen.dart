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

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late FlashMode _flashMode;
  late CameraController _cameraController;

  late final AnimationController _recordAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final Animation<double> _recordAnimation =
      Tween(begin: 1.0, end: 1.3).animate(_recordAnimationController);

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    debugPrint(cameras.toString());

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      _isSelfieMode
          ? cameras
              .firstWhere((e) => e.lensDirection == CameraLensDirection.back)
          : cameras
              .firstWhere((e) => e.lensDirection == CameraLensDirection.front),
      ResolutionPreset.ultraHigh,
      imageFormatGroup: ImageFormatGroup.bgra8888,
    );

    await _cameraController.initialize();
    _flashMode = _cameraController.value.flashMode;
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

    await initCamera();
    setState(() {
      _hasPermission = true;
    });
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    setState(() {
      _flashMode = newFlashMode;
    });
  }

  void _startRecordingOnTapDown(TapDownDetails details) {
    _recordAnimationController.forward();
    _progressAnimationController.forward();
  }

  void _stopRecording() {
    _recordAnimationController.reverse();
    _progressAnimationController.reset();
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
    _progressAnimationController.addListener(() {
      setState(() {});
    });
    _progressAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
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
                  Positioned(
                    top: Sizes.size48,
                    right: Sizes.size12,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: _toggleSelfieMode,
                          color: Colors.white,
                          icon: const Icon(Icons.cameraswitch),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => _setFlashMode(FlashMode.off),
                          color: (_flashMode == FlashMode.off)
                              ? Colors.amber.shade200
                              : Colors.white,
                          icon: const Icon(Icons.flash_off_rounded),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => _setFlashMode(FlashMode.always),
                          color: (_flashMode == FlashMode.always)
                              ? Colors.amber.shade200
                              : Colors.white,
                          icon: const Icon(Icons.flash_on_rounded),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => _setFlashMode(FlashMode.auto),
                          color: (_flashMode == FlashMode.auto)
                              ? Colors.amber.shade200
                              : Colors.white,
                          icon: const Icon(Icons.flash_auto_rounded),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => _setFlashMode(FlashMode.torch),
                          color: (_flashMode == FlashMode.torch)
                              ? Colors.amber.shade200
                              : Colors.white,
                          icon: const Icon(Icons.flashlight_on_rounded),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size40,
                    child: GestureDetector(
                      onTapDown: _startRecordingOnTapDown,
                      onTapUp: (_) => _stopRecording(),
                      child: ScaleTransition(
                        scale: _recordAnimation,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: Sizes.size96,
                              height: Sizes.size96,
                              child: CircularProgressIndicator(
                                color: Colors.red.shade400,
                                strokeWidth: Sizes.size6,
                                value: _progressAnimationController.value,
                              ),
                            ),
                            Container(
                              width: Sizes.size80,
                              height: Sizes.size80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
