import 'package:flutter/material.dart';

// waiting after first account creation ***done!
class HoldOn extends StatelessWidget {
  const HoldOn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            height: size.height * 0.4,
            child: Image.asset('assets/logo.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Bonjour cher ",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
                textAlign: TextAlign.center,
              ),
              Text(
                "USER ",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Merci d'avoir créer un compte !",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "veuillez contactez un admin pour confirmer la création de votre compte",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
