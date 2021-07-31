import 'package:flutter/material.dart';

import 'Screens/authentication/SignUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'crt app',
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
