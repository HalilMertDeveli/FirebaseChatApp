import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_app/common/routes/pages.dart';
import 'package:flutter_firebase_chat_app/firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

