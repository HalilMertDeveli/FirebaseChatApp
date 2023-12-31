import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({ this.uid});

  //referance for our collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  //saving the userData
  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }

  Future<Stream<DocumentSnapshot<Object?>>> getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  //get user groups
  getUserGroup() async {
    return userCollection.doc(uid).snapshots();
  }
//binance
  //Creating a group
  Future createGroup(String userName, String id, String groupName) async {
    DocumentReference groupDocumentReference = await groupCollection.add({
      "groupName": groupName,
      "groupIcon": "",
      "admin": "${id}_$userName",
      "members": [],
      "groupId": "",
      "recentMessage": "", 
      "recentMessageSender": "",
    });
    //update members
    await groupDocumentReference.update({
      "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      "groupId": groupDocumentReference.id,
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);

    return await userDocumentReference.update({
      "groups":
          FieldValue.arrayUnion(["${groupDocumentReference.id}_$groupName"]),
    });
  }

  getChats(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }
  Future getGroupAdmin(String groupId)async{
    DocumentReference d = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot['admin'];
  }

  //getting group members
  Future<Stream<DocumentSnapshot<Object?>>> getGroupMember(groupId)async{
    return groupCollection.doc(groupId).snapshots();
  }

  //search 
  searchByName(String groupName){
    return groupCollection.where("groupName",isEqualTo:groupName).get();
  }
  Future<bool> isUserJoined(String groupName,String groupId,String userName) async{
    DocumentReference userDocumentReference  = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await  userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['groups'];
    if(groups.contains("${groupId}_$groupName")){
      return true;
    }else{
      return false;
    }
  }


  //togging , group join and exit 
  Future toggleGroupJoin (String groupId,String userName,String groupName) async{
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];

    if (groups.contains("${groupId}_$groupName")) {
      await userDocumentReference.update({"groups":FieldValue.arrayRemove(["${groupId}_$groupName"])});
      await groupDocumentReference.update({"groups":FieldValue.arrayRemove(["${uid}_$userName"])});

    }

  }

}
