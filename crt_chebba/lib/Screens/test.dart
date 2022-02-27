import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAdmin.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:intl/intl.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Color get selectionColor => kGreenColor;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AppBarCrt(
                nomFamille: 'test',
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    RowText(
                        champ1: 'Date : ',
                        champ2: new DateFormat("dd-MM-yyyy")
                            .format(DateTime.now())),
                    SizedBox(height: 10),
                    RowText(champ1: 'Ajouté par : ', champ2: ' nom user '),
                    SizedBox(height: 10),
                    RowText(champ1: 'Equipe :', champ2: ''),
                    TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    RowText(champ1: 'Description :', champ2: ''),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 1,
                      maxLines: 20,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBarAdmin(),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextButtonCrt(BackgroundColor: kSecondryColor, f: () {  }, myText: 'Ajouter', TextColor: kWhitColor,),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: TextButtonCrt(BackgroundColor: kGreyColor, f: () {  }, myText: 'Annuler', TextColor: kWhitColor,),
            ),
          ],
        ),
      ),
    );
  }
}

class TextButtonCrt extends StatelessWidget {
  const TextButtonCrt(
      {Key? key,
      required this.myText,
      required this.BackgroundColor,
      required this.TextColor,
      required this.f()})
      : super(key: key);
  final String myText;
  final Color BackgroundColor;
  final Color TextColor;
  final Function f;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: f(),
      child: Text(myText , style : TextStyle(color: TextColor)),
      style: TextButton.styleFrom(
        backgroundColor: BackgroundColor,
        primary: kWhitColor,
      ),
    );
  }
}

class IconButtonCRT extends StatelessWidget {
  const IconButtonCRT({ Key? key ,required this.myText,
      required this.BackgroundColor,
      required this.TextColor,
      required this.f(),  required this.icon}) : super(key: key);
        final String myText;
  final Color BackgroundColor;
  final Color TextColor;
  final Function f;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: BackgroundColor,
                              primary: TextColor,
                            ),
                            label: Text(myText),
                            icon: Icon(icon),
                            onPressed: f() );
  }
}
