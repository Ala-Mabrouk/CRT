import 'dart:ui';

import 'package:flutter/material.dart';

class Hi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(height: 200, image: AssetImage("../assets/logo.png")),
            SizedBox(height: 40),
            Center(
              child: Text(
                "Bonjour  **Nom d'utlisateur ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Text("Veuillez attendre qu'un admin comfirme votre compte !"),
            SizedBox(height: 40),
          ],
        )
            //<- place where the image appears
            ),
      ),
    );
  }
}
