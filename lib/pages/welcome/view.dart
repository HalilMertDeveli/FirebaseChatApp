import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_app/pages/welcome/controller.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Hello world '),
        ),
      ),
    );
  }
}
