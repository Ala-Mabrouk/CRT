import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/Screens/commun%20Screens/TextButtonCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAgentCRT.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//new Widget: add donnation to a family !! ******** done!
class AjouterLeDon extends StatefulWidget {
  const AjouterLeDon({Key? key, required this.idfamily}) : super(key: key);
  final String idfamily;
  @override
  _AjouterLeDonState createState() => _AjouterLeDonState();
}

class _AjouterLeDonState extends State<AjouterLeDon> {
  @override
  Color get selectionColor => kGreenColor;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AppBarCrt(
                info: 'Ajouter Le Don',
                nomFamille: '',
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
                    RowText(
                        champ1: 'Ajouté par : ', champ2: ' Connected user '),
                    SizedBox(height: 10),
                    RowText(champ1: 'Equipe :', champ2: ''),
                    TextField(
                      onChanged: (value) {
                        //here we need to save the selected equipe
                      },
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
                      onChanged: (value) {
                        //here we need to save the description of the donnation
                      },
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
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextButtonCrt(
                BackgroundColor: kSecondryColor,
                f: () {
                  //fonction de sauvegarde du dons
                },
                myText: 'Ajouter',
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
      //    bottomNavigationBar: bottomNavigationBarAgent(),
    );
  }
}
