import 'package:flutter_firebase_chat_app/pages/welcome/controller.dart';
import 'package:get/get.dart';

class WelcomeBindings implements Bindings {
  // we wrote dep in this class
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
