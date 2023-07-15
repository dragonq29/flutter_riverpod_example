import 'package:shared_preferences/shared_preferences.dart';

class CcccDdddRepository {
  static const String _ccccKey = "cccc";
  static const String _ddddKey = "dddd";

  final SharedPreferences _preferences;

  CcccDdddRepository(this._preferences);

  Future<void> setCccc(bool value) async {
    _preferences.setBool(_ccccKey, value);
  }

  Future<void> setDddd(bool value) async {
    _preferences.setBool(_ddddKey, value);
  }

  bool getCccc() {
    return _preferences.getBool(_ccccKey) ??
        false; // ??는 왼쪽에 있는 함수의 인스턴스가 null이 아니면 수행하고, null이면 오른쪽 값을 씀
  }

  bool getDddd() {
    return _preferences.getBool(_ddddKey) ?? false;
  }
}
