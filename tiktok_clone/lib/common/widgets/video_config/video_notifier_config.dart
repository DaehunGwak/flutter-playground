import 'package:flutter/widgets.dart';

class VideoNotifierConfig extends ChangeNotifier {
  bool autoMute = true;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
    debugPrint('VideoNotifierConfig.autoMute: $autoMute');
  }
}

final videoNotifierConfig = VideoNotifierConfig();
