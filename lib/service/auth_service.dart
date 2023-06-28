import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //THERE WILL BE LOGIN FUNCTOIN 


  //THERE WILL BE REGISTER FUNCTION
  Future registerUserWithEmailAndPassword(String fullName,String email,String password)async{
    try{
      User user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;

      if (user != null) {
        //call our database service to update the data
        return true;
      }
    }
    on FirebaseAuthException catch(e){
      print(e.message);
    }
    
  }

  //THERE WILL BE SIGN-UP FUNCTION


}