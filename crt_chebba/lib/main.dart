import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/authentication/SignUp.dart';
import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Screens/authentication/onHoldScreen.dart';
import 'package:crt_chebba/Screens/commun%20Screens/splash.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  debugPaintSizeEnabled = false;
  debugPaintBaselinesEnabled = false;
  debugPaintPointersEnabled = false;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting('fr_FR', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// main is up to Date with other working branch of date
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: '29LT Bukra',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => splashScreen(),
        '/login': (context) => login(),
        '/signUp': (context) => SignUp(),
        //'/addDonations': (context) => AjouterDon(),
        '/ListAllFamilies': (context) => ListAllFamilies(),
        //  '/detailFamily': (context) => detailleFamille(),
        '/HoldOn': (context) => HoldOn(
              agentCrt: AgentCrt.empty(),
            ),
      },
    );
  }
}
