import 'package:crt_chebba/Screens/Home/HomePageDirection.dart';
import 'package:crt_chebba/Screens/Home/HomePageDirectionAdmin.dart';
import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/CustomDropDown.dart';
import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/Screens/commun%20Screens/TextButtonCrt.dart';
import 'package:crt_chebba/Services/familyServices/familyServices.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class updateFamily extends StatefulWidget {
  final Family toUpdateFamily;
  const updateFamily({Key? key, required this.toUpdateFamily})
      : super(key: key);
  @override
  _updateFamilyState createState() => _updateFamilyState();
}

int _value = 1;
String labelTextDatePere = '2022-03-22  ';
String labelTextDateMere = '2022-03-22  ';

class _updateFamilyState extends State<updateFamily> {
  DateTime selectedDate = DateTime.now();
  final _updateFamilyFormkey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context, String field) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1935, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        if (field == 'pere') {
          widget.toUpdateFamily.fatherBirthDate = picked;
          labelTextDatePere = picked.toString();
        } else {
          widget.toUpdateFamily.motherBirthDate = picked;
          labelTextDateMere = picked.toString();
        }
      });
  }

  Widget filed({text1, text2, theField}) {
    return TextFormField(
      validator: (val) {
        if (val == null || val == '') {
          return 'Champ naicessaire';
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: kSecondryColor, fontSize: 16),
        labelStyle: TextStyle(fontSize: 14),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kSecondryColor),
        ),
        labelText: text1,
        hintText: text2,
      ),
      initialValue: text2,
      onChanged: theField,
    );
  }

  Widget Phonefiled({text1, text2, theField}) {
    return TextFormField(
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
        floatingLabelStyle: TextStyle(color: kSecondryColor, fontSize: 16),
        labelStyle: TextStyle(fontSize: 14),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kSecondryColor),
        ),
        labelText: text1,
        hintText: text2,
      ),
      initialValue: text2,
      keyboardType: TextInputType.number,
      onChanged: theField,
    );
  }

  Widget CINfeild({text1, text2, theField}) {
    return TextFormField(
      validator: (val) {
        if (val == null || val == '') {
          return 'Champ naicessaire';
        }
        if (val.toString().length != 8) {
          return "CIN invalid";
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: kSecondryColor, fontSize: 16),
        labelStyle: TextStyle(fontSize: 14),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kSecondryColor),
        ),
        labelText: text1,
        hintText: text2,
      ),
      initialValue: text2,
      keyboardType: TextInputType.number,
      onChanged: theField,
    );
  }

  Widget redText({text1}) {
    return Text(
      text1,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
    );
  }

  Widget DatePicker(String theField) {
    // String labelText = "--/--/----";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              "Date de naissance " + theField,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            IconButton(
              onPressed: () {
                _selectDate(context, theField);
              },
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Text((theField == 'pere')
            ? labelTextDatePere.substring(0, 10)
            : labelTextDateMere.substring(0, 10)),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
            '! Modifer les informations !',
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Confirmer les informations modifier ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Annuler'),
                onPressed: () async {
                  print('alert dissmiss');

                  Navigator.pop(context);
                  setState(() {});
                }),
            TextButton(
              child: const Text(
                'Confirmer',
                style: TextStyle(
                    color: kSecondryColor, fontWeight: FontWeight.w600),
              ),
              onPressed: () async {
                FamilyService().updateFamily(widget.toUpdateFamily);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => (isAdmin)
                            ? new HomePageDirectionAdmin()
                            : new HomePageDirection()));
                setState(() {});
                //(context,MaterialPageRoute(builder: (context) => const signIn()));
              },
            )
          ],
        );
      },
    );
  }

  bool isAdmin = false;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            isAdmin = prefValue.getBool('isAdmin') ?? false;
          })
        });
    _value = int.parse(widget.toUpdateFamily.IdQuartier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhitColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _updateFamilyFormkey,
            child: Column(
              children: [
                /*  AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.grey[350],
                  title: Text(
                    'Modifier une  famille',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kSecondryColor,
                        fontSize: 15),
                  ),
                ), */
                AppBarCrt(
                  nomFamille: ' ' + widget.toUpdateFamily.familyName,
                  info: 'Modifier la Famille de',
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      RowText(champ1: 'Informations du pére :', champ2: ''),

                      SizedBox(height: 9),
                      filed(
                          text1: "Nom du pére",
                          text2: widget.toUpdateFamily.fatherLastName,
                          theField: (val) {
                            widget.toUpdateFamily.fatherLastName = val;
                          }),
                      SizedBox(height: 9),
                      filed(
                          text1: "Prénom du pére",
                          text2: widget.toUpdateFamily.fatherFirstName,
                          theField: (val) {
                            widget.toUpdateFamily.fatherFirstName = val;
                          }),
                      SizedBox(height: 9),
                      CINfeild(
                          text1: "CIN pére",
                          text2: widget.toUpdateFamily.fatherCIN,
                          theField: (val) {
                            widget.toUpdateFamily.fatherCIN = val;
                          }),
                      SizedBox(height: 9),
                      DatePicker('pere'),
                      // filed(
                      //     text1: "Date de naissance",
                      //     text2: "",
                      //     theField: (val) {
                      //       myNewFamily.fatherBirthDate = val;
                      //     }),
                      SizedBox(height: 9),
                      Phonefiled(
                          text1: "Numéro de téléphone du pére",
                          text2: widget.toUpdateFamily.fatherPhone,
                          theField: (val) {
                            widget.toUpdateFamily.fatherPhone = val;
                          }),
                      SizedBox(height: 9),
                      filed(
                          text1: "Travail du pére",
                          text2: widget.toUpdateFamily.FatherJob,
                          theField: (val) {
                            widget.toUpdateFamily.FatherJob = val;
                          }),
                      SizedBox(height: 50),
                      RowText(champ1: 'Informations du mére :', champ2: ''),
                      filed(
                          text1: "Nom du mére",
                          text2: widget.toUpdateFamily.motherLastName,
                          theField: (val) {
                            widget.toUpdateFamily.motherLastName = val;
                          }),
                      SizedBox(height: 9),
                      filed(
                          text1: "Prénom du mére",
                          text2: widget.toUpdateFamily.motherFirstName,
                          theField: (val) {
                            widget.toUpdateFamily.motherFirstName = val;
                          }),
                      SizedBox(height: 9),
                      CINfeild(
                          text1: "CIN mére",
                          text2: widget.toUpdateFamily.motherCIN,
                          theField: (val) {
                            widget.toUpdateFamily.motherCIN = val;
                          }),
                      SizedBox(height: 9),
                      DatePicker('mere'),

                      // filed(
                      //     text1: "Date de naissance",
                      //     text2: "",
                      //     theField: (val) {
                      //       myNewFamily.motherBirthDate = val;
                      //     }),
                      SizedBox(height: 9),
                      Phonefiled(
                          text1: "Numéro de téléphone du mére",
                          text2: widget.toUpdateFamily.motherPhone,
                          theField: (val) {
                            widget.toUpdateFamily.motherPhone = val;
                          }),
                      SizedBox(height: 9),
                      filed(
                          text1: "Travail du mére",
                          text2: widget.toUpdateFamily.motherJob,
                          theField: (val) {
                            widget.toUpdateFamily.motherJob = val;
                          }),
                      SizedBox(height: 50),
                      RowText(champ1: 'Etat famille : ', champ2: ''),
                      filed(
                          text1: "Status family",
                          text2: widget.toUpdateFamily.familyStatus,
                          theField: (val) {
                            widget.toUpdateFamily.familyStatus = val;
                          }),
                      SizedBox(height: 50),
                      RowText(
                          champ1: 'Informations sur les enfants :  ',
                          champ2: ''),

                      TextFormField(
                        validator: (val) {
                          if (val == null || val == '') {
                            return 'Champ naicessaire';
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre des enfants',
                          hintText: 'Nombre des enfants',
                        ),
                        initialValue:
                            widget.toUpdateFamily.nbChildren.toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          widget.toUpdateFamily.nbChildren = int.parse(val);
                        },
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextField(
                        minLines: 2,
                        maxLines: 8,
                        decoration: InputDecoration(
                          labelText: "Informations sur les enfants",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (val) {
                          widget.toUpdateFamily.childrenInfo = val;
                        },
                      ),
                      SizedBox(height: 50),
                      RowText(champ1: 'Localisation :  ', champ2: ''),

                      SizedBox(height: 9),

                      DropdownButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          iconSize: 40,
                          isExpanded: true,
                          isDense: true,
                          borderRadius: BorderRadius.circular(9),
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Quartier Bassatine',
                              ),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Sidi Salem',
                              ),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Garaa tabel + beb nian',
                              ),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Henchir Moussa',
                              ),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Wahab',
                              ),
                              value: 5,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'El marssa',
                              ),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Quartier charquia',
                              ),
                              value: 7,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Dowira',
                              ),
                              value: 8,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Centre Ville',
                              ),
                              value: 9,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Rue de tbarna + hratla',
                              ),
                              value: 10,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'El frahta',
                              ),
                              value: 11,
                            ),
                            DropdownMenuItem(
                              child: CustomDropDown(
                                info: 'Exterieur de la Chebba,rue Mahdia',
                              ),
                              value: 12,
                            ),
                          ],
                          onChanged: (value) {
                            setState(() async {
                              _value = int.parse(value.toString());
                              widget.toUpdateFamily.IdQuartier =
                                  _value.toString();
                              setState(() {});
                            });
                          },
                          hint: Text("Selon le quartier")),
                      SizedBox(height: 9),
                      filed(
                          text1: "Adresse",
                          text2: widget.toUpdateFamily.familyLocation,
                          theField: (val) {
                            widget.toUpdateFamily.familyLocation = val;
                          }),
                      SizedBox(height: 9),

                      filed(
                          text1: "Map ID",
                          text2: widget.toUpdateFamily.IDMap,
                          theField: (val) {
                            widget.toUpdateFamily.IDMap = val;
                          }),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextButtonCrt(
                                BackgroundColor: kSecondryColor,
                                f: () {
                                  if (_updateFamilyFormkey.currentState!
                                      .validate()) {
                                    showAlertDialog(context);
                                  }
                                },
                                myText: 'Modifier',
                                TextColor: kWhitColor,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextButtonCrt(
                                BackgroundColor: kGreyColor,
                                f: () => Navigator.of(context).pop(true),
                                myText: 'Annuler',
                                TextColor: kWhitColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
