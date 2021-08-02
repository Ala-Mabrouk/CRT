import 'package:crt_chebba/Screens/Home/home.dart';
import 'package:crt_chebba/Screens/authentication/SignUp.dart';
import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/dons/add_donation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('erreur inti');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: '/login',
            routes: {
              '/': (context) => splashScreen(),
              '/login': (context) => login(),
              '/signUp': (context) => SignUp(),
              '/donations': (context) => AjouterDon(),
              '/Home': (context) => home(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return splashScreen();
      },
    );
  }
}
