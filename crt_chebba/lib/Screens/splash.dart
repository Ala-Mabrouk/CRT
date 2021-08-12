import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crt_chebba/Screens/Home/home.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/login.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//cheking the authentication to choose which screen will be shown
    final connectedUser = AuthenticationService().user;
    //  final connectedUser = Provider.of<AgentCrt>(context);

    return StreamProvider.value(
      value: connectedUser,
      initialData: null,
      child: MaterialApp(
          title: 'crt app',
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
              duration: 2000,
              splash: Image.asset('assets/logo.png'),
              nextScreen: login(),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Colors.grey.shade100)),
    );
  }
}
