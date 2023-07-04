import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {


  //keys for shared preferences , There will be 3 key , userLoginKey,userNameKey,userEmailKey
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  //there will be save data operation with shared preferences

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }
  static Future<bool> saveUserNameSf(String userName)async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }
  static Future<bool> setUserEmailSf(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  //there will be get data opartion with shared preferences

  static Future<bool?> getUserLoggedInStatus()async{
    SharedPreferences sharedPreferencesInstace = await SharedPreferences.getInstance();
    return sharedPreferencesInstace.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF()async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }
  static Future<String?> getUserNameFromSF()async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}
