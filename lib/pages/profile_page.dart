import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_app/pages/auth/login_page.dart';
import 'package:flutter_firebase_chat_app/pages/home_page.dart';
import 'package:flutter_firebase_chat_app/service/auth_service.dart';
import 'package:flutter_firebase_chat_app/widgets/widget.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;

  ProfilePage({
    Key? key,
    required this.userName,
    required this.email,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          "Profile Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 50),
        children: [
          Icon(
            Icons.person_2,
            size: 150,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            widget.userName,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.email,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(
            height: 3,
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("Hastalıklarım"),
            selected: false,
            onTap: () {
              nextScreenReplace(
                context,
                HomePage(),
              );
            },
          ),
          SizedBox(height: 10),
          ListTile(
            iconColor: Theme.of(context).primaryColor,
            leading: Icon(Icons.person,color:Theme.of(context).primaryColor,),
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            selected: true,
            onTap: () {},
          ),
          ListTile(
            onTap: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await authService.signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                (route) => false);
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  });
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      )),
    );
  }
}
