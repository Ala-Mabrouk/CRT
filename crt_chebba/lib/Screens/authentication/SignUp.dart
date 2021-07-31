import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _SignUpFormkey = GlobalKey<FormState>();

  String email = '';
  String pass = '';
  bool isAdmin = false;
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
              setState(() => email = val);
              print(email);
            },
            decoration: InputDecoration(
              hintText: 'folen@5658',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
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

    Widget InputField({label, hint, obscur}) {
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
            decoration: InputDecoration(
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
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
        child: RaisedButton(
          elevation: 5,
          onPressed: () {
            final formstatus = _SignUpFormkey.currentState;
            if (!formstatus!.validate()) {
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
            "S'INSCRIRE",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 120),
          child: Form(
            key: _SignUpFormkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                      InputField(label: 'Nom:', hint: 'foulen', obscur: false),
                      InputField(
                          label: 'Prenom:', hint: 'foulen', obscur: false),

                      EmailField(),
                      InputField(
                          label: 'Mot de passe:',
                          hint: '********',
                          obscur: true),
                      //   DatePicker(),
                      InputField(
                          label: 'Telephone:',
                          hint: '+216 22222222',
                          obscur: false),
                      CheckBoxField(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SignUpBTN(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget DatePicker() {
//   return TextButton(
//       onPressed: () {
//        DatePicker.showDatePicker(context,
//             showTitleActions: true,
//             minTime: DateTime(2018, 3, 5),
//             maxTime: DateTime(2019, 6, 7),)
//       },
//       child: Text(
//         'show date time picker (Chinese)',
//         style: TextStyle(color: Colors.blue),
//       ));
// }

bool isEmailValid(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern.toString());
  return regex.hasMatch(email);
}
