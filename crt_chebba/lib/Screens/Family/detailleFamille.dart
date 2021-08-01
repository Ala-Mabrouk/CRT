import 'package:flutter/material.dart';

class detailleFamille extends StatefulWidget {
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
          title: Text("Famille : xxxx xxxx "),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            redText(text1: "Informations des parents :"),
            Divider(color: Colors.black),
            blackText(text1: "Nom du pere : ", text2: "xxxxxx"),
            blackText(text1: "Date de naissance : ", text2: "xxxxxx"),
            blackText(text1: "Numero de telephone : ", text2: "xxxxxx"),
            blackText(text1: "CIN : ", text2: "xxxxxx"),
            SizedBox(
              height: 10,
            ),
            blackText(text1: "Nom du mere : ", text2: "xxxxxx"),
            blackText(text1: "Date de naissance : ", text2: "xxxxxx"),
            blackText(text1: "Numero de telephone : ", text2: "xxxxxx"),
            blackText(text1: "CIN : ", text2: "xxxxxx"),
            SizedBox(
              height: 20,
            ),
            blackText(text1: "Etat de la famille : ", text2: "xxxxxx"),
            SizedBox(
              height: 20,
            ),
            redText(text1: "Enfants :"),
            Divider(color: Colors.black),
            blackText(text1: "Nombre d'enfants : ", text2: "x"),
            EnfantText(text1: "details kol tfol "),
            blackText(text1: "Autre remarques : ", text2: "x"),
            SizedBox(
              height: 20,
            ),
            redText(text1: "Localisation :"),
            Divider(color: Colors.black),
            blackText(text1: "Adresse : ", text2: "x"),
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
