import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';
  final _SignInFomKey = GlobalKey<FormState>();
  String email = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  height: 30,
                ),
                Text(
                  "Récupérer votre mot de passe!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            validator: (val) => (val == null ||
                                    !EmailValidator.validate(val.toString()))
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
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 3.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 3.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 3.0),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 45,
                        width: size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_SignInFomKey.currentState!.validate() ==
                                true) {
                              try {
                                AuthenticationService().resetPassword(email);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Un lien est envoyé à votre adresse e-mail."),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 15,
                                  backgroundColor: Colors.grey,
                                ));
                                Navigator.pop(context);
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(e.toString()),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 15,
                                  backgroundColor: Colors.redAccent,
                                ));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red,
                            padding: const EdgeInsets.all(2),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          child: Text(
                            "ENVOYER",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "<- Retour ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    /* return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email Your Email',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Send Email'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Sign In'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    ); */
  }
}
