import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {


  //keys for shared preferences , There will be 3 key , userLoginKey,userNameKey,userEmailKey
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  //there will be save data operation with shared preferences

  //there will be get data opartion with shared preferences

  static Future<bool?> getUserLoggedInStatus()async{
    SharedPreferences sharedPreferencesInstace = await SharedPreferences.getInstance();
    return sharedPreferencesInstace.getBool(userLoggedInKey);
  }
}
