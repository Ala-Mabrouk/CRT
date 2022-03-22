import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/Screens/commun%20Screens/TextButtonCrt.dart';
import 'package:crt_chebba/Services/donationServices/donationsServices.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Donation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

//new Widget: add donnation to a family !! ******** done!
class AjouterLeDon extends StatefulWidget {
  const AjouterLeDon({Key? key, required this.idfamily}) : super(key: key);
  final String idfamily;
  @override
  _AjouterLeDonState createState() => _AjouterLeDonState();
}

String userName = '';

class _AjouterLeDonState extends State<AjouterLeDon> {
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            userName = prefValue.getString('userFullName') ?? '----';
          })
        });
    super.initState();
  }

  @override
  Color get selectionColor => kGreenColor;

  Widget build(BuildContext context) {
    Donation tempDon = Donation();
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
                        champ2: new DateFormat("dd-MM-yyyy  HH:mm")
                            .format(DateTime.now())),
                    SizedBox(height: 10),
                    RowText(champ1: 'Ajouté par : ', champ2: userName),
                    SizedBox(height: 10),
                    RowText(champ1: 'Equipe :', champ2: ''),
                    TextField(
                      onChanged: (value) {
                        tempDon.Equipe = value;
                        tempDon.publierPar = userName;
                        tempDon.dateDonation = DateTime.now();
                        tempDon.idFamily = widget.idfamily;
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
                        tempDon.description = value;
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
                  DonationService().addDonation(tempDon);
                  Navigator.pop(context);
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
