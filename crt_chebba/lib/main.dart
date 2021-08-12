import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/Screens/Family/detailleFamille.dart';
import 'package:crt_chebba/Screens/Home/Hi.dart';
import 'package:crt_chebba/Screens/Home/home.dart';
import 'package:crt_chebba/Screens/authentication/SignUp.dart';
import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Screens/splash.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'Screens/dons/add_donation.dart';

bool _isLoged = false;
void main() async {
  debugPaintSizeEnabled = false;
  debugPaintBaselinesEnabled = false;
  debugPaintPointersEnabled = false;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _isLoged = await AuthenticationService().autoAthenticate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print('isloged= ' + _isLoged.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => !_isLoged ? splashScreen() : home(),
        '/login': (context) => login(),
        '/signUp': (context) => SignUp(),
        //'/addDonations': (context) => AjouterDon(),
        '/Home': (context) => home(),
        //  '/detailFamily': (context) => detailleFamille(),
        '/hi': (context) => Hi(),
      },
      // create multiple sub route
      onGenerateRoute: (RouteSettings settings) {
        if (!_isLoged) {
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => login(),
          );
        } //end if
      },

      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
            builder: (BuildContext context) => new splashScreen());
      },
    );
  }
}
