import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thread_clone/constants/sizes.dart';

class WritePhotoScreen extends StatefulWidget {
  const WritePhotoScreen({super.key});

  @override
  State<WritePhotoScreen> createState() => _WritePhotoScreenState();
}

class _WritePhotoScreenState extends State<WritePhotoScreen>
    with WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  FlashMode _flashMode = FlashMode.off;
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    initPermissions();
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

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }
    final nowCamera = _isSelfieMode
        ? cameras
            .firstWhere((e) => e.lensDirection == CameraLensDirection.front)
        : cameras
            .firstWhere((e) => e.lensDirection == CameraLensDirection.back);
    final newCameraController = CameraController(
      nowCamera,
      ResolutionPreset.ultraHigh,
      imageFormatGroup: ImageFormatGroup.bgra8888,
    );
    await newCameraController.initialize();
    await newCameraController.lockCaptureOrientation();
    await newCameraController.prepareForVideoRecording(); // for ios
    _flashMode = FlashMode.off;
    await newCameraController.setFlashMode(_flashMode);

    setState(() {
      _cameraController = newCameraController;
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      await initCamera();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Sizes.size32),
                      bottomRight: Radius.circular(Sizes.size32),
                    ),
                  ),
                  child:
                      (_hasPermission && _cameraController.value.isInitialized)
                          ? CameraPreview(_cameraController)
                          : null,
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: _onBackButtonPressed,
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: Sizes.size36,
                        ),
                      ),
                      const Spacer(),
                      if (_hasPermission &&
                          _cameraController.value.isInitialized)
                        _buildCameraControlBar()
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size32,
              bottom: Sizes.size72,
            ),
            child: Row(
              children: [
                const Spacer(),
                const Text(
                  'Camera',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Library',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCameraControlBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: _toggleFlashMode,
              icon: (_flashMode == FlashMode.off)
                  ? const Icon(
                      Icons.flash_off_rounded,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.flash_on_rounded,
                      color: Colors.amber.shade300,
                    ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: Sizes.size64,
                height: Sizes.size64,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              GestureDetector(
                onTap: _takePicture,
                child: Container(
                  width: Sizes.size76,
                  height: Sizes.size76,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: Sizes.size3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: IconButton(
              onPressed: _toggleCamera,
              icon: const Icon(
                Icons.sync,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleFlashMode() async {
    try {
      if (_flashMode == FlashMode.off) {
        await _cameraController.setFlashMode(FlashMode.torch);
        _flashMode = FlashMode.torch;
      } else {
        await _cameraController.setFlashMode(FlashMode.off);
        _flashMode = FlashMode.off;
      }
    } on CameraException catch (e) {
      if (e.code.startsWith("setFlashModeFailed")) {
        debugPrint("failed change flashMode: ${e.description}");
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
              title: const Text('Failed to change flash mode'),
              content: Text(e.description!),
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        rethrow;
      }
    }
    setState(() {});
  }

  Future<void> _toggleCamera() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _takePicture() async {
    final xFile = await _cameraController.takePicture();
    if (mounted) {
      Navigator.of(context).pop([xFile]);
    }
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }
}
