import 'package:crt_chebba/Screens/Home/home.dart';
import 'package:crt_chebba/Services/familyServices/familyServices.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        border: OutlineInputBorder(),
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red,
          title: Text("Ajouter une famille"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                redText(text1: "informations du pere : "),
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
                SizedBox(height: 9),
                redText(text1: "informations du mere : "),
                SizedBox(height: 9),
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
                SizedBox(height: 9),
                redText(text1: "Etat famille : "),
                filed(
                    text1: "status family",
                    text2: "",
                    theField: (val) {
                      myNewFamily.familyStatus = val;
                    }),
                redText(text1: "informations des enfants : "),
                SizedBox(height: 9),
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

                SizedBox(height: 9),
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
                SizedBox(height: 9),
                redText(text1: "Localisation : "),
                SizedBox(height: 9),
                filed(
                    text1: "Adresse",
                    text2: "",
                    theField: (val) {
                      myNewFamily.familyLocation = val;
                    }),
                SizedBox(height: 9),
                filed(text1: "Map ID", text2: ""),
                Row(
                  children: [
                    RaisedButton(
                      elevation: 5,
                      onPressed: () async {
                        if (FamilyService().addFamily(myNewFamily) != null) {
                          Navigator.pushReplacement(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new home()));
                        }
                      },
                      padding: EdgeInsets.all(2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.red,
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    RaisedButton(
                      elevation: 5,
                      onPressed: () async {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new home()));
                      },
                      padding: EdgeInsets.all(2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.grey,
                      child: Text(
                        "Anuuler",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
