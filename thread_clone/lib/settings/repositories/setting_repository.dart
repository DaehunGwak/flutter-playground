import 'package:shared_preferences/shared_preferences.dart';

class SettingFileRepository {
  SettingFileRepository(this._instance);

  static const _darkModeKey = 'isDarkMode';

  final SharedPreferences _instance;

  Future<void> setDarkMode(bool value) async {
    await _instance.setBool(_darkModeKey, value);
  }

  bool isDarkMode() {
    return _instance.getBool(_darkModeKey) ?? false;
  }
}
