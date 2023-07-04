import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_app/helper/helper_function.dart';
import 'package:flutter_firebase_chat_app/pages/search_page.dart';
import 'package:flutter_firebase_chat_app/service/auth_service.dart';
import 'package:flutter_firebase_chat_app/widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  String userName="";
  String email="";

  @override
  void initState(){

    super.initState();
    gettingUserData();
  }

  gettingUserData()async{
    await HelperFunctions.getUserEmailFromSF().then((value){
      setState((){
        if(value != null){
          email = value;
        }
        
      });
    });
    await HelperFunctions.getUserNameFromSF().then((value){
      setState((){
        if(value != null){
          userName = value;
        }
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(context, const SearchPage());
            },
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Groups",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.grey,
            ),
            Text(userName)
          ],
        ),
      ),
    );
  }
}
