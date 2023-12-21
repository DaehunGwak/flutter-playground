import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/main/home/models/playback_config_model.dart';
import 'package:tiktok_clone/features/main/home/repositories/playback_config_repository.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  PlaybackConfigViewModel(this._repository);

  final PlaybackConfigRepository _repository;

  late final PlaybackConfigModel _model = PlaybackConfigModel(
    muted: _repository.isMuted(),
    autoplay: _repository.isAutoplay(),
  );

  bool get muted => _model.muted;

  bool get autoplay => _model.autoplay;

  void toggleMuted() {
    setMuted(!_model.muted);
  }

  void setMuted(bool value) {
    _repository.setMuted(value);
    _model.muted = value;
    notifyListeners();
  }

  void toggleAutoplay() {
    setAutoplay(!_model.autoplay);
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    _model.autoplay = value;
    notifyListeners();
  }
}
