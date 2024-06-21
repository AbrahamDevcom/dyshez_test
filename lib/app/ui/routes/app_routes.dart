import 'package:dyshez_test/app/ui/pages/login/controller/login_controller.dart';
import 'package:dyshez_test/app/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../global_controllers/global_controller.dart';
import '../pages/home/controller/home_controller.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/splash/controller/splash_controller.dart';

class AppRoutes {
  // Un getter estático que devuelve un mapa de rutas de aplicación
  static Map<String, WidgetBuilder> get getAppicationRoutes => {
        // La ruta para la LoginPage
        LoginPage.route: (_) => const LoginPage(),
        HomePage.route: (_) => const HomePage(),
        SplashPage.route: (_) => const SplashPage(),
      };

  // Un getter estático que devuelve una lista de proveedores SingleChildWidget
  static List<SingleChildWidget> get providers => [
        // Un ChangeNotifierProvider para el GlobalController
        ChangeNotifierProvider(create: (_) => GlobalController()),
        // Un ChangeNotifierProvider para el LoginController
        ChangeNotifierProvider(create: (_) => LoginController()),
        // Un ChangeNotifierProvider para el SplashController
        ChangeNotifierProvider(create: (_) => SplashController()),
        // Un ChangeNotifierProvider para el HomeController
        ChangeNotifierProvider(create: (_) => HomeController())
      ];
}
