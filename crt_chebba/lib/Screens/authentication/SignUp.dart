import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Screens/authentication/onHoldScreen.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _SignUpFormkey = GlobalKey<FormState>();
  AuthenticationService auth = AuthenticationService();

  AgentCrt _agentCrt = AgentCrt.empty();

  bool isAdmin = false;

  DateTime selectedDate = DateTime.now();

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1935, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget EmailField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 0, 5),
            child: Text(
              'Email',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            validator: (val) => !EmailValidator.validate(val.toString())
                ? 'Email incorect'
                : null,
            onChanged: (val) {
              setState(() {
                _agentCrt.email = val;
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintText: 'Votre e-mail',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      );
    }

    Widget DatePicker() {
      // String labelText = "--/--/----";
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                "Date de naissance ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ), //Border.all
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(selectedDate.toString().substring(0, 10)),
              //child: Text(DateFormat("d/MMMM/y").format(selectedDate)),
            ),
          ),
        ],
      );
    }
/* 
    Widget DatePicker() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 0, 5),
            child: Text(
              'Date de naissance',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            enabled: false,
            validator: (val) =>
                (val == null || val == '') ? 'Champ naicessaire' : null,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => _selectDate(context),
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintText: '2021/05/24',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.datetime,
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    } */

    Widget CheckBoxField() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 20,
          child: Row(children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.red),
              child: Checkbox(
                value: isAdmin,
                onChanged: (value) {
                  setState(() {
                    isAdmin = value!;
                  });
                },
                checkColor: Colors.red,
                activeColor: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "S'inscrire en tant que admin",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      );
    }

    Widget InputField({label, hint, required bool obscur, field}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 0, 5),
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
              validator: (val) {
                if (val == null || val == '') {
                  return 'Champ naicessaire';
                }
                if (val.length < 8) {
                  return 'Mot de passe faible';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                hintText: hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: obscur,
              onChanged: field
              //  (val) {
              //   setState(() {
              //     _agentCrt.phone = val;
              //   });
              //   print(field);
              // },
              ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }

    Widget InputPhoneField({label, hint, obscur, field}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 0, 5),
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
              validator: (val) {
                if (val == null || val == '') {
                  return 'Champ naicessaire';
                }
                if (val.toString().length != 8) {
                  return 'Numero telephone invalid';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                hintText: hint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: field
              //  (val) {
              //   setState(() {
              //     _agentCrt.phone = val;
              //   });
              //   print(field);
              // },
              ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }

    Widget SignUpBTN() {
      return Container(
        height: 40,
        width: size.width * 0.5,
        child:
        ElevatedButton(
          child: Text(
            "S'INSCRIRE",
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
            final formstatus = _SignUpFormkey.currentState;
            // if (formstatus!.validate()) {
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(content: Text('email invalid !!!')));
            // }
            // _agentCrt.isAdmin = isAdmin;
            if (formstatus!.validate() == true) {
              _agentCrt.isAdmin = false;
              _agentCrt.birthDate = selectedDate.toString();
              AgentCrt? res = await auth.registerNewAgent(_agentCrt);
              if (res.agentId.isNotEmpty) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new HoldOn(
                              agentCrt: res,
                            )),
                    (route) => false);
              }
            }
          },
        ),
        
        
        
        
         /* RaisedButton(
          onPressed: () async {
            final formstatus = _SignUpFormkey.currentState;
            // if (formstatus!.validate()) {
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(content: Text('email invalid !!!')));
            // }
            // _agentCrt.isAdmin = isAdmin;
            if (formstatus!.validate() == true) {
              _agentCrt.isAdmin = false;
              _agentCrt.birthDate = selectedDate.toString();
              AgentCrt? res = await auth.registerNewAgent(_agentCrt);
              if (res.agentId.isNotEmpty) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new HoldOn(
                              agentCrt: res,
                            )),
                    (route) => false);
              }
            }
          },
          padding: EdgeInsets.all(2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.red,
          child: Text(
            "S'INSCRIRE",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ) */
      );
    }

    Widget FinalLine() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Vous avez déja un compte ? "),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => login()),
                (route) => false);
          },
          child: Text(
            "se conneter ! ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ]);
    }

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _SignUpFormkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: size.height * 0.35,
                  child: Image.asset('assets/header.png'),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: Image.asset('../assets/header.png'),
                  //         fit: BoxFit.fill)),
                ),
                Text(
                  "Créer un compte",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                  child: Column(
                    children: <Widget>[
                      InputField(
                          label: 'Nom:',
                          hint: 'Votre nom',
                          obscur: false,
                          field: (val1) {
                            setState(() {
                              _agentCrt.name = val1;
                            });
                          }),
                      InputField(
                          label: 'Prenom:',
                          hint: 'Votre prenom',
                          obscur: false,
                          field: (val2) {
                            setState(() {
                              _agentCrt.lastName = val2;
                            });
                          }),
                      EmailField(),
                      InputField(
                          label: 'Mot de passe:',
                          hint: '********',
                          obscur: true,
                          field: (val3) {
                            setState(() {
                              _agentCrt.password = val3;
                            });
                          }),
                      DatePicker(),
                      InputPhoneField(
                          label: 'Telephone:',
                          hint: '22222222',
                          obscur: false,
                          field: (val4) {
                            setState(() {
                              _agentCrt.phone = val4;
                            });
                          }),

                      //    CheckBoxField(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SignUpBTN(),
                SizedBox(
                  height: 20,
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
