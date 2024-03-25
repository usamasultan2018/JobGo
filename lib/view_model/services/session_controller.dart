import 'dart:convert';
import 'package:jobgo/view_model/services/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

//singleton class
class SessionController {
  static final SessionController _session = SessionController._internel();
  bool? isLogin;
  late UserModel user;

  factory SessionController() {
    return _session;
  }

  SessionController._internel() {
    isLogin = false;
  }
  static Future<void> saveUserInPreference(dynamic user) async {
    SharedPreferenceClass.setValueBoolen('isLogin', true);
    if (user != null) {
      SharedPreferenceClass.setValue('user', jsonEncode(user));
    } else {
      SharedPreferenceClass.setValue('user', 'null');
    }
  }

  static Future<void> getUserFromPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic userData = prefs.getString("user");

    if (userData != null && userData.isNotEmpty) {
      SessionController().user = UserModel.fromJson(jsonDecode(userData));
    } else {
      SessionController().user = UserModel(uid: '', fullName: '', email: '');
    }

    SessionController().isLogin = prefs.getBool('isLogin') ?? false;
  }

  //removing User Data from Prefrence
  static Future<void> removeUserFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', '');
    prefs.setBool('isLogin', false);
  }
}