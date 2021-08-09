import 'package:flutter/material.dart';

class addFamily extends StatefulWidget {
  @override
  _addFamilyState createState() => _addFamilyState();
}

class _addFamilyState extends State<addFamily> {
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
          title: Text("Ajouter don"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                redText(text1: "informations du pere : "),
                SizedBox(height: 9),
                filed(text1: "nom du pere", text2: ""),
                SizedBox(height: 9),
                filed(text1: "prénom du pere", text2: ""),
                SizedBox(height: 9),
                filed(text1: "CIN", text2: ""),
                SizedBox(height: 9),
                filed(text1: "Date de naissance", text2: ""),
                SizedBox(height: 9),
                filed(text1: "Numéro de téléphone", text2: ""),
                SizedBox(height: 9),
                redText(text1: "informations du mere : "),
                SizedBox(height: 9),
                filed(text1: "nom du mere", text2: ""),
                SizedBox(height: 9),
                filed(text1: "prénom du mere", text2: ""),
                SizedBox(height: 9),
                filed(text1: "CIN", text2: ""),
                SizedBox(height: 9),
                filed(text1: "Date de naissance", text2: ""),
                SizedBox(height: 9),
                filed(text1: "Numéro de téléphone", text2: ""),
                SizedBox(height: 9),
                redText(text1: "informations des enfants : "),
                SizedBox(height: 9),
                filed(text1: "Nombre des enfants", text2: ""),
                SizedBox(height: 9),
                TextField(
                  minLines: 2,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: "Informations sur les enfants",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 9),
                redText(text1: "Localisation : "),
                SizedBox(height: 9),
                filed(text1: "Adresse", text2: ""),
                SizedBox(height: 9),
                filed(text1: "Map ID", text2: ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget filed({text1, text2}) {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: text1,
      hintText: text2,
    ),
  );
}

Widget redText({text1}) {
  return Text(
    text1,
    style:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
  );
}
