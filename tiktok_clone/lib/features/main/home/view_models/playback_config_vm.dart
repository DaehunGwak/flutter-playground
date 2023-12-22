import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/main/home/models/playback_config_model.dart';
import 'package:tiktok_clone/features/main/home/repositories/playback_config_repository.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  PlaybackConfigViewModel(this._repository);

  final PlaybackConfigRepository _repository;

  // for initialization (state 필드에 저장될 초기 데이터)
  @override
  PlaybackConfigModel build() {
    return PlaybackConfigModel(
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    );
  }

  void toggleMuted() {
    setMuted(!state.muted);
  }

  // state는 immutable 이기 때문에 새로운 객체를 생성해주어야 함
  // state가 새로운 것으로 교체된다면 새로 교체되었다가 notify 할 수 있음
  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlaybackConfigModel(
      muted: value,
      autoplay: state.autoplay,
    );
  }

  void toggleAutoplay() {
    setAutoplay(!state.autoplay);
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModel(
      muted: state.muted,
      autoplay: value,
    );
  }
}

final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
  () => throw UnimplementedError(),
);
