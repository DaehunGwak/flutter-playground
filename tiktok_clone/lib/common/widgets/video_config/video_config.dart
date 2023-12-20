import 'package:flutter/widgets.dart';

class VideoConfig extends InheritedWidget {
  const VideoConfig({
    super.key,
    required super.child,
  });

  final bool autoMute = true;

  static VideoConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfig>()!;
  }

  /// widget 을 rebuild 할지 정의
  /// covariant: 인자로 부모 class 타입으로 지정하지 않고, 자식 클래스만 받도록 설정 변경
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    debugPrint('VideoConfig.updateShouldNotify: ${oldWidget.toStringDeep()}');
    return true;
  }
}
