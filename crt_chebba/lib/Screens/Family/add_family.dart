import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
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

class addFamily extends StatefulWidget {
  @override
  _addFamilyState createState() => _addFamilyState();
}

int _value = 1;
String labelTextDatePere = '2022-03-22  ';
String labelTextDateMere = '2022-03-22  ';

class _addFamilyState extends State<addFamily> {
  Family myNewFamily = Family();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, String field) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1935, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        if (field == 'pere') {
          myNewFamily.fatherBirthDate = picked;
          labelTextDatePere = picked.toString();
        } else {
          myNewFamily.motherBirthDate = picked;
          labelTextDateMere = picked.toString();
        }
      });
  }

  Widget filed({text1, text2, theField}) {
    return TextField(
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: kSecondryColor, fontSize: 16),
        labelStyle: TextStyle(fontSize: 14),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kSecondryColor),
        ),
        labelText: text1,
        hintText: text2,
      ),
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
            : labelTextDateMere
          ..substring(0, 10)),
      ],
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhitColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Colors.grey[350],
                title: Text(
                  'Ajouter une  famille',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kSecondryColor,
                      fontSize: 15),
                ),
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
                        text2: "",
                        theField: (val) {
                          myNewFamily.fatherLastName = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "Prénom du pére",
                        text2: "",
                        theField: (val) {
                          myNewFamily.fatherFirstName = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "CIN pére",
                        text2: "",
                        theField: (val) {
                          myNewFamily.fatherCIN = val;
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
                    filed(
                        text1: "Numéro de téléphone",
                        text2: "",
                        theField: (val) {
                          myNewFamily.fatherPhone = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "Travail du pére",
                        text2: "",
                        theField: (val) {
                          myNewFamily.FatherJob = val;
                        }),
                    SizedBox(height: 50),
                    RowText(champ1: 'Informations du mére :', champ2: ''),
                    filed(
                        text1: "Nom du mére",
                        text2: "",
                        theField: (val) {
                          myNewFamily.motherLastName = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "Prénom du mére",
                        text2: "",
                        theField: (val) {
                          myNewFamily.motherFirstName = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "CIN mére",
                        text2: "",
                        theField: (val) {
                          myNewFamily.motherCIN = val;
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
                    filed(
                        text1: "Numéro de téléphone",
                        text2: "",
                        theField: (val) {
                          myNewFamily.motherPhone = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "Travail du mére",
                        text2: "",
                        theField: (val) {
                          myNewFamily.motherJob = val;
                        }),
                    SizedBox(height: 50),
                    RowText(champ1: 'Etat famille : ', champ2: ''),
                    filed(
                        text1: "Status family",
                        text2: "",
                        theField: (val) {
                          myNewFamily.familyStatus = val;
                        }),
                    SizedBox(height: 50),
                    RowText(
                        champ1: 'Informations sur les enfants :  ', champ2: ''),

                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre des enfants',
                        hintText: 'Nombre des enfants',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        myNewFamily.nbChildren = int.parse(val);
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
                        myNewFamily.childrenInfo = val;
                      },
                    ),
                    SizedBox(height: 50),
                    RowText(champ1: 'Localisation :  ', champ2: ''),

                    SizedBox(height: 9),
                    filed(
                        text1: "Adresse",
                        text2: "",
                        theField: (val) {
                          myNewFamily.familyLocation = val;
                        }),
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
                            myNewFamily.IdQuartier = _value.toString();
                            setState(() {});
                          });
                        },
                        hint: Text("Selon le quartier")),

                    SizedBox(height: 9),
                    filed(
                        text1: "Map ID",
                        text2: "",
                        theField: (val) {
                          myNewFamily.IDMap = val;
                        }),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextButtonCrt(
                              BackgroundColor: kSecondryColor,
                              f: () async {
                                FamilyService().addFamily(myNewFamily);
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => (isAdmin)
                                            ? new HomePageDirectionAdmin()
                                            : new HomePageDirection()));
                              },
                              myText: 'Comfirmer',
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
    );
  }
}
