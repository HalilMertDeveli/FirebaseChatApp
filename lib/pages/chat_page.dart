import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_app/pages/group_info.dart';
import 'package:flutter_firebase_chat_app/service/database_service.dart';
import 'package:flutter_firebase_chat_app/widgets/widget.dart';

class ChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const ChatPage(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.userName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot>? chats;
  String admin= "";

  @override
  void initState() {
    getChatAndAdmin();
    super.initState();
  }
  void getChatAndAdmin() {
    DatabaseService().getChats(widget.groupId).then((val){
      setState(() {
        chats = val;
      });
    });
    DatabaseService().getGroupAdmin(widget.groupId).then((val){
      setState(() {
        admin=val;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupName),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(
                context,
                GroupInfo(groupId: widget.groupId,groupName: widget.groupName,adminName: admin,),
              );
            },
            icon: Icon(
              Icons.info,
            ),
          ),
        ],
      ),
    );
  }
  
}
