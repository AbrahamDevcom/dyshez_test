import 'package:dyshez_test/app/ui/global_controllers/global_controller.dart';
import 'package:dyshez_test/app/ui/pages/home/home_page.dart';
import 'package:dyshez_test/app/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  void init(context) {
    Future.delayed(Durations.extralong4, () {
      if (GlobalController().currentSession != null) {
        Navigator.pushNamed(context, HomePage.route);
      } else {
        Navigator.pushNamed(context, LoginPage.route);
      }
    });
  }
}
