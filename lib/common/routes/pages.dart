import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_app/common/routes/names.dart';
import 'package:flutter_firebase_chat_app/pages/welcome/bindings.dart';
import 'package:flutter_firebase_chat_app/pages/welcome/view.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObserver();
  static final List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () =>const WelcomePage(),
        binding: WelcomeBindings())
  ];
}
