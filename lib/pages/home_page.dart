import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_app/service/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          authService.signOut();
        },
        child: Text("Log-out"),
      ),
    ));
  }
}
