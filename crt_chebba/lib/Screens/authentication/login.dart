import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/constants/defaultButton.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _SignInFomKey = GlobalKey<FormState>();

    Widget InputField({myIcon, hint, obscur}) {
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
              hintText: hint,
              prefixIcon: Icon(
                myIcon,
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
            obscureText: obscur,
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
          onPressed: () {
            final formstatus = _SignInFomKey.currentState;
            if (formstatus!.validate()) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('email invalid !!!')));
            }
            print('smt');
          },
          padding: EdgeInsets.all(15),
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
        Text(
          "Creéz-en un ! ",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ]);
    }

    return Scaffold(
      backgroundColor: kGColor,
      body: Container(
        child: Form(
          key: _SignInFomKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('../assets/header.png'),
                        fit: BoxFit.fill)),
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
                    InputField(
                        myIcon: Icons.person,
                        hint: 'Email adresse',
                        obscur: false),
                    SizedBox(
                      height: 10,
                    ),
                    InputField(
                        myIcon: Icons.lock, hint: 'Mot de passe', obscur: true),
                    SizedBox(
                      height: 30,
                    ),
                    SignInBTN(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              FinalLine(),
            ],
          ),
        ),
      ),
    );
  }
}

class SingForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Entrer votre nom d\'utilisateur",
              labelText: 'Nom d\'utilisateur',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Entrer votre mot de passe",
              labelText: 'Mot de passe',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          DefaultButton(
            text: "SE CONNECTER",
            press: () {},
            kcolor: kBColor,
          ),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Vous n'avez pas encore un compte ? "),
            Text(
              "Creéz-en un ! ",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Ou se connecter avec "),
            IconButton(
              icon: Image(image: AssetImage('assets/fb_logo.png')),
              color: Colors.pink,
              onPressed: () {},
            ),
            IconButton(
              icon: Image(image: AssetImage('assets/google_logo.png')),
              color: Colors.pink,
              onPressed: () {},
            ),
          ])
        ],
      ),
    );
  }
}
