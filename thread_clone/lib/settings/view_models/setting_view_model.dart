import 'package:flutter/widgets.dart';
import 'package:thread_clone/settings/models/setting.dart';
import 'package:thread_clone/settings/repositories/setting_repository.dart';

class SettingViewModel extends ChangeNotifier {
  SettingViewModel(this._settingFileRepository);

  final SettingFileRepository _settingFileRepository;

  late final Setting _setting = Setting(
    isDarkMode: _settingFileRepository.isDarkMode(),
  );

  bool get isDarkMode => _setting.isDarkMode;

  Future<void> setDarkMode(bool value) async {
    await _settingFileRepository.setDarkMode(value);
    _setting.isDarkMode = value;
    notifyListeners();
  }
}
