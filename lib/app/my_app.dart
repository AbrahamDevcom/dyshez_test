import 'package:dyshez_test/app/ui/global_controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'ui/pages/login/login_page.dart';
import 'ui/pages/splash/splash_page.dart';
import 'ui/routes/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    GlobalController.supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      GlobalController().currentSession = session;
      // Do something when there is an auth event
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dyshez',
      debugShowCheckedModeBanner: false,
      navigatorKey: MyApp.navigatorKey,
      // localizationsDelegates: GlobalMaterialLocalizations.delegates,
      // supportedLocales: const [
      //   Locale('es'),
      // ],
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: SplashPage.route,
      routes: AppRoutes.getAppicationRoutes,
    );
  }
}
