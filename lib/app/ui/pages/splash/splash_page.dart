import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  static const String route = "/splash";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SplashController>(context);
    controller.init(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/logo.png',
                width: 64,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            CircularProgressIndicator.adaptive()
          ],
        ),
      ),
    );
  }
}
