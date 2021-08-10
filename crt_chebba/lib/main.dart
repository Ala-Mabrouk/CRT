import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/Screens/Family/detailleFamille.dart';
import 'package:crt_chebba/Screens/Home/Hi.dart';
import 'package:crt_chebba/Screens/Home/home.dart';
import 'package:crt_chebba/Screens/authentication/SignUp.dart';
import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/dons/add_donation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CollectionReference users =
      FirebaseFirestore.instance.collection('CRT_Agents');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => splashScreen(),
        '/login': (context) => login(),
        '/signUp': (context) => SignUp(),
        '/addDonations': (context) => AjouterDon(),
        '/Home': (context) => home(),
        //  '/detailFamily': (context) => detailleFamille(),
        '/hi': (context) => Hi(),
      },
    );
  }
}
