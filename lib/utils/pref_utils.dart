




import 'package:nexcon/utils/shared_preference.dart';

class PrefUtils {


  static void setToken(String value) {
    Prefs.prefs?.setString(SharedPrefsKeys.token, value);
  }

  static String getToken() {
    final String? value = Prefs.prefs?.getString(SharedPrefsKeys.token);
    return value ?? '';
  }
static void setRoleSelection(String value) {
    Prefs.prefs?.setString(SharedPrefsKeys.roleSelection, value);
  }

  static String getRoleSelection() {
    final String? value = Prefs.prefs?.getString(SharedPrefsKeys.roleSelection);
    return value ?? '';
  }



  static void setRememberMe(bool value) {
    Prefs.prefs?.setBool(SharedPrefsKeys.rememberMe, value);
  }

  static bool getRememberMe() {
    final bool? value = Prefs.prefs?.getBool(SharedPrefsKeys.rememberMe);
    return value ?? false;
  }


  static void setUserPassword(String value) {
    Prefs.prefs?.setString(SharedPrefsKeys.userPassword, value);
  }

  static String getUserPassword() {
    final String? value = Prefs.prefs?.getString(SharedPrefsKeys.userPassword);
    return value ?? '';
  }

  static void setUserEmailLogin(String value) {
    Prefs.prefs?.setString(SharedPrefsKeys.userEmailLogin, value);
  }

  static String getUserEmailLogin() {
    final String? value =
    Prefs.prefs?.getString(SharedPrefsKeys.userEmailLogin);
    return value ?? '';
  }

  static void setIsLogin(bool value) {
    Prefs.prefs?.setBool(SharedPrefsKeys.isLogin, value);
  }

  static bool getIsLogin() {
    final bool? value = Prefs.prefs?.getBool(SharedPrefsKeys.isLogin);
    return value ?? false;
  }
  static void setUserId(int value) {
    Prefs.prefs?.setString(SharedPrefsKeys.userId, value.toString());
  }

  static int getUserId() {
    final String? value = Prefs.prefs?.getString(SharedPrefsKeys.userId);
    return int.tryParse(value ?? '') ?? 0;
  }

  static void setConferenceListCache(String jsonString) {
    Prefs.prefs?.setString(SharedPrefsKeys.conferenceListCacheKey, jsonString);
  }

  static String getConferenceListCache() {
    final String? value = Prefs.prefs?.getString(SharedPrefsKeys.conferenceListCacheKey);
    return value ?? '';
  }

}

class SharedPrefsKeys {

  static const token = 'token';
  static const roleSelection = 'roleSelection';
  static const rememberMe = 'rememberMe';
  static const userPassword = 'userPassword';
  static const userEmailLogin = 'userEmailLogin';
  static const isLogin = 'isLogin';
  static const userId = 'userId';
  static const conferenceListCacheKey = 'conferenceListCache';
}
