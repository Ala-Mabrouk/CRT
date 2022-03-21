import 'package:crt_chebba/Screens/Administration/Settings.dart';
import 'package:crt_chebba/Screens/Administration/usersList.dart';
import 'package:crt_chebba/Screens/Home/HomePageDirection.dart';
import 'package:crt_chebba/Screens/Home/HomePageDirectionAdmin.dart';
import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/authentication/onHoldScreen.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  AuthenticationService auth = AuthenticationService();
  final _SignInFomKey = GlobalKey<FormState>();

  String email = '';
  String pass = '';
  String err = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget InputField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (val) =>
                (val == null || !EmailValidator.validate(val.toString()))
                    ? 'Email incorect'
                    : null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              hintText: "foulen@foulen.foulen",
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey, width: 3.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 3.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 3.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            onChanged: (value) {
              setState(() => email = value);
            },
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }

    Widget InputPassField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (val) =>
                (val == null || !EmailValidator.validate(val.toString()))
                    ? 'pass incorect'
                    : null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              hintText: '*********',
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey, width: 3.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 3.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 3.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            onChanged: (value) {
              setState(() => pass = value);
            },
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }

    Widget SignInBTN() {
      return Container(
        height: 40,
        width: size.width * 0.5,
        child: RaisedButton(
          elevation: 5,
          onPressed: () async {
            AgentCrt? res =
                await AuthenticationService().signInEmailPassword(email, pass);
            if (res != null) {
              if (res.isConfirmed && res.isAdmin) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new HomePageDirectionAdmin()),
                    (route) => false);
              } else if (res.isConfirmed) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new HomePageDirection()),
                    (route) => false);
              } else {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new HoldOn(agentCrt: res)));
              }
            }
          },
          padding: EdgeInsets.all(2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.red,
          child: Text(
            "SE CONNECTER",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    Widget FinalLine() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Vous n'avez pas encore un compte ? "),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: Text(
            "Creéz-en un ! ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ]);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _SignInFomKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width,
                  child: Image.asset('assets/header.png'),

                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage('../assets/header.png'),
                  //         fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bienvenue !",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Se connecter pour continuer",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Column(
                    children: [
                      InputField(),
                      SizedBox(
                        height: 10,
                      ),
                      InputPassField(),
                      SizedBox(
                        height: 30,
                      ),
                      SignInBTN(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        err,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ],
                  ),
                ),
                FinalLine(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
