import 'package:crt_chebba/Screens/Home/Hi.dart';
import 'package:crt_chebba/Screens/Home/home.dart';
import 'package:crt_chebba/Screens/authentication/SignUp.dart';
import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Screens/commun%20Screens/onHoldScreen.dart';
import 'package:crt_chebba/Screens/commun%20Screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool _isLoged = false;
bool _isAdmin = false;
void main() async {
  debugPaintSizeEnabled = false;
  debugPaintBaselinesEnabled = false;
  debugPaintPointersEnabled = false;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => splashScreen(),
        '/login': (context) => login(),
        '/signUp': (context) => SignUp(),
        //'/addDonations': (context) => AjouterDon(),
        '/Home': (context) => home(),
        //  '/detailFamily': (context) => detailleFamille(),
        '/hi': (context) => Hi(),
        '/HoldOn': (context) => HoldOn(),
      },
    );
  }
}
