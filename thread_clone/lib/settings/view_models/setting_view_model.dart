import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/settings/models/setting.dart';
import 'package:thread_clone/settings/repositories/setting_repository.dart';

class SettingViewModel extends Notifier<Setting> {
  SettingViewModel(this._settingFileRepository);

  final SettingFileRepository _settingFileRepository;

  Future<void> setDarkMode(bool value) async {
    await _settingFileRepository.setDarkMode(value);
    state = Setting(isDarkMode: value);
  }

  @override
  Setting build() {
    return Setting(
      isDarkMode: _settingFileRepository.isDarkMode(),
    );
  }
}

final settingProvider = NotifierProvider<SettingViewModel, Setting>(
  () => throw UnimplementedError(),
);
