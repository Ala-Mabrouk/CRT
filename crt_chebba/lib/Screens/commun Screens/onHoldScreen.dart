import 'package:flutter/material.dart';

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

            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('../assets/header.png'),
            //         fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your account is not conformed yet !!",
            style: TextStyle(
                color: Colors.orange[900],
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Please wait for an admin agent to confirm your account.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "You can call the adminstration to make a request",
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
