import 'package:shared_preferences/shared_preferences.dart';

import '../constant/app_shared_pref_keys.dart';

class AuthenticationManager {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppSharedPrefrencesKeys.tokenKey);
  }

  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppSharedPrefrencesKeys.tokenKey, token);
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppSharedPrefrencesKeys.tokenKey);
  }
}
