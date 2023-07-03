import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_chat_app/helper/helper_function.dart';
import 'package:flutter_firebase_chat_app/service/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //THERE WILL BE LOGIN FUNCTOIN

  //THERE WILL BE REGISTER FUNCTION
  Future registerUserWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        //call our database service to update the data
        await DatabaseService(uid: user.uid).updateUserData(fullName, email);

        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //THERE WILL BE SIGN-UP FUNCTION

  //sign_up function
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserNameSf("");
      await HelperFunctions.setUserEmailSf("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
