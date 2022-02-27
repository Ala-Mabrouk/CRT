/* import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeInfo extends StatefulWidget {
  final AgentCrt passedUser;
  const ChangeInfo({Key? key, required this.passedUser}) : super(key: key);

  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  final AuthenticationService _authService = AuthenticationService();
  toastMsg(String msg, BuildContext theContext) {
    print("toast affiche");
    ScaffoldMessenger.of(theContext).showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.fixed,
      elevation: 15,
      backgroundColor: Colors.redAccent[300],
    ));
  }

  submitLog(AgentCrt us, bool passChange, BuildContext theContext) async {
    if (_formkey.currentState!.validate() == true) {
      try {
        if (await _authService.updateUSerInfo(us, passChange) != null) {
          Navigator.pop(theContext);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          toastMsg("Mot de passe est faible !", theContext);
        } else {
          toastMsg("Problem avec le serveur !", theContext);
        }
      }
    }
  }

  final Globalkey<FormState> _formkey = Globalkey<FormState>();
  bool showPassword = true;
  String tempStr = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ConnectivityChangeNotifier>(builder: (BuildContext context,
          ConnectivityChangeNotifier connectivityChangeNotifier, rwidget) {
        return SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                    child: IconButton(
                      iconSize: 35,
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/logo.png",
                          width: size.width * 0.7,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Mise à jour mes informations",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFiledContainerType2(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      initialValue: widget.passedUser.lastName,
                                      validator: (value) {
                                        if (value == '') {
                                          return "Le nom est vide !";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Entrez votre nom',
                                        labelStyle:
                                            const TextStyle(color: kBlackColor),
                                        labelText: 'Nom :',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: kGreyColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: kBlackColor,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onChanged: (newValue) {
                                        widget.passedUser.lastName =
                                            newValue.toString();
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormField(
                                      initialValue: widget.passedUser.name,
                                      validator: (value) {
                                        if (value == '') {
                                          return "le prénom est vide !";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Entrez votre prénom',
                                        labelStyle:
                                            const TextStyle(color: kBlackColor),
                                        labelText: 'Prénom :',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: kGreyColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: kBlackColor,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onChanged: (newValue) {
                                        widget.passedUser.name =
                                            newValue.toString();
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormField(
                                      initialValue: widget.passedUser.phone,
                                      validator: (value) {
                                        if (value == '') {
                                          return "le télèphone est vide !";
                                        }
                                        if (value!.length != 12) {
                                          return "le nemero doit étre 12 chiffre !";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: '+216 ** *** ***',
                                        labelStyle:
                                            const TextStyle(color: kBlackColor),
                                        labelText: 'Télèphone :',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: kGreyColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: kBlackColor,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.phone,
                                      onChanged: (newValue) {
                                        widget.passedUser.phone =
                                            newValue.toString();
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.length < 6 &&
                                            value.isNotEmpty) {
                                          return "Mot de passe doit étre de 6 caracteres minimum !";
                                        }
                                      },
                                      obscureText: showPassword,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                              color: kBlackColor,
                                              width: 2.0,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                              color: kGreyColor,
                                              width: 2.0,
                                            ),
                                          ),
                                          hintText: "Nouveau mot de passe ",
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              (showPassword)
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: kBlackColor,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                showPassword = !showPassword;
                                              });
                                            },
                                          ),
                                          border: InputBorder.none),
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (newValue) {
                                        tempStr = newValue;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              //space between
                              const SizedBox(
                                height: 15,
                              ),
                              //password field
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        RoundedButton(
                          text: "Enregistrer",
                          color: kPrimaryColor,
                          textColor: kWhitColor,
                          onPressed: () {
                            if (!connectivityChangeNotifier.connected) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text(
                                  'No Internet Connection!!!',
                                ),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                action: SnackBarAction(
                                  label: 'options',
                                  onPressed: () {
                                    print("snack is taped ");
                                    AppSettings.openWIFISettings();
                                  },
                                  textColor: Colors.white,
                                  disabledTextColor: Colors.grey,
                                ),
                              ));
                            } else {
                              if (tempStr.isNotEmpty) {
                                widget.passedUser.password = tempStr;
                                submitLog(widget.passedUser, true, context);
                              } else {
                                submitLog(widget.passedUser, false, context);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
 */