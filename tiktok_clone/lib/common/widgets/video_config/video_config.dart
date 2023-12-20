import 'package:flutter/widgets.dart';

class VideoConfigData extends InheritedWidget {
  const VideoConfigData({
    super.key,
    required this.autoMute,
    required this.toggleMuted,
    required super.child,
  });

  final bool autoMute;
  final void Function() toggleMuted;

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
  }

  /// widget 을 rebuild 할지 정의
  /// covariant: 인자로 부모 class 타입으로 지정하지 않고, 자식 클래스만 받도록 설정 변경
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    debugPrint('VideoConfig.updateShouldNotify: ${oldWidget.toStringDeep()}');
    return true;
  }
}

class VideoConfig extends StatefulWidget {
  const VideoConfig({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
  bool autoMute = false;

  void toggleMuted() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
      toggleMuted: toggleMuted,
      autoMute: autoMute,
      child: widget.child,
    );
  }
}
