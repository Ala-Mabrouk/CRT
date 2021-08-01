import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'authentication/login.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'crt app',
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Icons.home,
            nextScreen: login(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.grey.shade100));
  }
}
