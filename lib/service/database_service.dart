import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({required this.uid});

  //referance for our collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  //updating the userData
  Future updateUserData(String fullName,String email)async{

  }


}