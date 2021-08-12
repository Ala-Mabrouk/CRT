import 'package:crt_chebba/Screens/dons/donation_card.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';

class detailleFamille extends StatefulWidget {
  const detailleFamille({Key? key, required this.theFamily}) : super(key: key);
  final Family theFamily;
  @override
  _detailleFamilleState createState() => _detailleFamilleState();
}

class _detailleFamilleState extends State<detailleFamille> {
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
          title: Text("Famille :" + widget.theFamily.familyName),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            RaisedButton(
              elevation: 5,
              onPressed: () async {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new dons(familyId: widget.theFamily.familyName)));
              },
              padding: EdgeInsets.all(2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.green,
              child: Text(
                "detail dons",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            redText(text1: "Informations des parents :"),
            Divider(color: Colors.black),
            blackText(
                text1: "Nom du pere : ",
                text2: widget.theFamily.fatherFirstName +
                    ' ' +
                    widget.theFamily.fatherLastName),
            blackText(
                text1: "Date de naissance : ",
                text2: widget.theFamily.fatherBirthDate.toString()),
            blackText(
                text1: "Numero de telephone : ",
                text2: widget.theFamily.fatherPhone),
            blackText(text1: "CIN : ", text2: widget.theFamily.fatherCIN),
            blackText(
                text1: "Occupation : ", text2: widget.theFamily.FatherJob),
            SizedBox(
              height: 10,
            ),
            blackText(
                text1: "Nom du mere : ",
                text2: widget.theFamily.motherFirstName +
                    ' ' +
                    widget.theFamily.motherLastName),
            blackText(
                text1: "Date de naissance : ",
                text2: widget.theFamily.motherBirthDate.toString()),
            blackText(
                text1: "Numero de telephone : ",
                text2: widget.theFamily.motherPhone),
            blackText(text1: "CIN : ", text2: widget.theFamily.motherCIN),
            blackText(
                text1: "Occupation : ", text2: widget.theFamily.motherJob),
            SizedBox(
              height: 20,
            ),
            blackText(
                text1: "Etat de la famille : ",
                text2: widget.theFamily.familyStatus),
            SizedBox(
              height: 20,
            ),
            redText(text1: "Enfants :"),
            Divider(color: Colors.black),
            blackText(
                text1: "Nombre d'enfants : ",
                text2: widget.theFamily.nbChildren.toString()),
            EnfantText(text1: "details kol tfol "),
            blackText(text1: "Autre remarques : ", text2: "x"),
            SizedBox(
              height: 20,
            ),
            redText(text1: "Localisation :"),
            Divider(color: Colors.black),
            blackText(
                text1: "Adresse : ", text2: widget.theFamily.familyLocation),
            blackText(text1: "Quartier : ", text2: "x"),
            blackText(text1: "Map : ", text2: " "),
          ]),
        ),
      ),
    );
  }
}

Widget EnfantText({text1}) {
  return Row(
    children: [
      Text(
        "* " + text1,
        style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black),
      ),
    ],
  );
}

Widget redText({text1}) {
  return Text(
    text1,
    style:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
  );
}

Widget blackText({text1, text2}) {
  print(text2);

  return Row(
    children: [
      Text(
        text1,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      Text(
        text2,
        style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black),
      ),
    ],
  );
}
