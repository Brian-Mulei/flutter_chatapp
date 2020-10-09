import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferencesUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferencesUserNameKey = "USERNAMEKEY";
  static String sharedPreferencesUserEmailKey = "USEREMAILKEY";

  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferencesUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferencesUserNameKey, userName);
  }

  static Future<bool> saveUserEmailLoggedInSharedPreference(
      String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        sharedPreferencesUserEmailKey, userEmail);
  }

  static Future<bool> getUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferencesUserLoggedInKey);
  }

  static Future<bool> getUserNameSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferencesUserNameKey);
  }
  static Future<bool>getUserEmailSharedPreference(String userName) async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferencesUserEmailKey);}
}