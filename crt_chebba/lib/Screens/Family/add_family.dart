import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/Screens/commun%20Screens/TextButtonCrt.dart';
import 'package:crt_chebba/Services/familyServices/familyServices.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';

class addFamily extends StatefulWidget {
  @override
  _addFamilyState createState() => _addFamilyState();
}

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
        } else {
          myNewFamily.motherBirthDate = picked;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          enabled: true,
          validator: (val) =>
              (val == null || val == '') ? 'Champ naicessaire' : null,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () =>
                  _selectDate(context, theField), //_selectDateFather(context),
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            border: OutlineInputBorder(),
            labelText: 'Date de naissance du ' + theField,
          ),
          keyboardType: TextInputType.datetime,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhitColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarCrt(
                info: 'Ajouter une  famille',
                nomFamille: '',
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    RowText(champ1: 'informations du pere :', champ2: ''),

                    SizedBox(height: 9),
                    filed(
                        text1: "nom du pere",
                        text2: "",
                        theField: (val) {
                          myNewFamily.fatherLastName = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "prénom du pere",
                        text2: "",
                        theField: (val) {
                          myNewFamily.fatherFirstName = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "CIN",
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
                        text1: "Travail du pere",
                        text2: "",
                        theField: (val) {
                          myNewFamily.FatherJob = val;
                        }),
                    SizedBox(height: 50),
                    RowText(champ1: 'informations du mere :', champ2: ''),
                    filed(
                        text1: "nom du mere",
                        text2: "",
                        theField: (val) {
                          myNewFamily.motherLastName = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "prénom du mere",
                        text2: "",
                        theField: (val) {
                          myNewFamily.motherFirstName = val;
                        }),
                    SizedBox(height: 9),
                    filed(
                        text1: "CIN",
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
                        text1: "Travail du mere",
                        text2: "",
                        theField: (val) {
                          myNewFamily.motherJob = val;
                        }),
                    SizedBox(height: 50),
                    RowText(champ1: 'Etat famille : ', champ2: ''),
                    filed(
                        text1: "status family",
                        text2: "",
                        theField: (val) {
                          myNewFamily.familyStatus = val;
                        }),
                    SizedBox(height: 50),
                    RowText(champ1: 'informations des enfants :  ', champ2: ''),

                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre des enfants',
                        hintText: 'Nombre des enfants',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        myNewFamily.nbChildren = val;
                      },
                    ),
SizedBox(height: 9,),
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
                    filed(text1: "Map ID", text2: ""),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextButtonCrt(
                              BackgroundColor: kSecondryColor,
                              f: () async {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new ListAllFamilies()));
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
