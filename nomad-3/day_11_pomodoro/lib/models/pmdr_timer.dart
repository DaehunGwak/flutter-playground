import 'pmdr_minute_type.dart';

const int _breakSeconds = Duration.secondsPerMinute * 5;

class PmdrTimer {
  int _nowSeconds = PmdrMinuteType.twentyFive.seconds;
  bool _isFocus = true;
  bool _isPlay = false;

  String get nowFormatSeconds =>
      (_nowSeconds % Duration.secondsPerMinute).toString().padLeft(2, '0');

  String get nowFormatMinutes =>
      (_nowSeconds ~/ Duration.secondsPerMinute).toString().padLeft(2, '0');

  int get nowSeconds => _nowSeconds;

  bool get isFocus => _isFocus;

  bool get isPlay => _isPlay;

  void play() {
    _isPlay = true;
  }

  void pause() {
    _isPlay = false;
  }

  void count() {
    if (_isPlay && (_nowSeconds > 0)) {
      _nowSeconds--;
    }
  }

  bool isFinished() => _isPlay && _isFocus && (_nowSeconds <= 0);

  bool isBreakFinished() => _isPlay && !_isFocus && (_nowSeconds <= 0);

  void onBreakMode() {
    _nowSeconds = _breakSeconds;
    _isFocus = false;
    _isPlay = true;
  }

  void reset(PmdrMinuteType minuteType) {
    _nowSeconds = minuteType.seconds;
    _isFocus = true;
    _isPlay = false;
  }

  void initSeconds(PmdrMinuteType minuteType) {
    _nowSeconds = minuteType.seconds;
  }
}
