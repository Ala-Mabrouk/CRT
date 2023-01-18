import 'package:crt_chebba/Screens/Administration/Settings.dart';
import 'package:crt_chebba/Screens/Administration/usersList.dart';
import 'package:crt_chebba/Screens/Home/HomePageDirection.dart';
import 'package:crt_chebba/Screens/Home/HomePageDirectionAdmin.dart';
import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/authentication/forgetPass.dart';
import 'package:crt_chebba/Screens/authentication/onHoldScreen.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/Services/familyServices/familyServices.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';

bool validateMail(String mail) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(mail);
  return emailValid;
}

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
  bool showPassword = true;
  @override
  void initState() {
    //  AuthenticationService().logout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    toastMsg(String msg, BuildContext theContext) {
      ScaffoldMessenger.of(theContext).showSnackBar(SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
        elevation: 15,
        backgroundColor: Colors.redAccent,
      ));
    }

    final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
    /*   final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>(); */

    RegExp exp = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
    submitLog(String mail, String pass, BuildContext theContext) async {
      if (_SignInFomKey.currentState!.validate() == true) {
        // _formKey.currentState!.save();
        try {
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
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastMsg("e-mail adresse introuvable !", theContext);
          } else if (e.code == 'wrong-password') {
            toastMsg("Mot de passe incorrect !", theContext);
          }
        }
      }
    }

    Size size = MediaQuery.of(context).size;

    Widget InputField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (val) => (val == null || !validateMail(val.toString()))
                ? 'Email format incorect'
                : null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              hintText: "NomPrenom@mail.fr",
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
            validator: (val) => (val == null || val.length < 6)
                ? 'Le mot de passe doit comporter au moins six caractères. '
                : null,
            obscureText: showPassword,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              hintText: 'Mot de passe',
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  (showPassword) ? Icons.visibility_off : Icons.visibility,
                  color: kBlackColor,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
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

    Widget SignInBTN(BuildContext cntx) {
      return Container(
        height: 40,
        width: size.width * 0.5,
        child: 
        ElevatedButton(
          child: Text(
            "SE CONNECTER",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(240, 229, 217, 182),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          onPressed: () async {
            submitLog(email, pass, cntx);
          },
        )
        /* RaisedButton(
          elevation: 5,
          onPressed: () async {
            submitLog(email, pass, cntx);
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
        ), */
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

    Widget forgetPass() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => ForgotPassword()));
          },
          child: Text(
            "Vous avez oublié votre mot de passe ? ",
            style: TextStyle(fontWeight: FontWeight.w500),
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
                ),
                SizedBox(
                  height: 10,
                ),
                /*  RaisedButton(
                  onPressed: () {
                    FamilyService().archiveFamily("BYOgKNnlUIOvCsPM");
                    //FamilyService().addFamily(new Family());
                  },
                  child: Text("add empty family"),
                ), */
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
                      SignInBTN(context),
                      /*    SizedBox(
                        height: 20,
                      ), */
                      Text(
                        err,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ],
                  ),
                ),
                forgetPass(),
                FinalLine(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
