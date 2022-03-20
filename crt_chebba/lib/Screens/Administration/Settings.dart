import 'package:crt_chebba/Screens/commun%20Screens/TextButtonCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAdmin.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';

import '../commun Screens/AppBarCrtType2.dart';
import '../commun Screens/RowText.dart';
import '../dons/ajouterDon.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

enum WidgetMarker { all, active, holon, blocked }

class _SettingsState extends State<Settings> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.all;
  Color c1 = kSecondryColor;
  Color c11 = kWhitColor;
  Color c2 = kWhitColor;
  Color c22 = kSecondryColor;
  Color c3 = kWhitColor;
  Color c33 = kSecondryColor;
  Color c4 = kWhitColor;
  Color c44 = kSecondryColor;

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.all:
        return getAll();

      case WidgetMarker.active:
        return getActive();
      case WidgetMarker.holon:
        return getholdon();
      case WidgetMarker.blocked:
        return getBlocked();
      default:
        return getAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBarCrtType2(
              champ1: ' Les membres CRT Chebba',
              champ2: '',
            ),
            Container(
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: c1,
                          primary: c11,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.all;
                            c1 = c22 = c33 = c44 = kSecondryColor;
                            c11 = c2 = c3 = c4 = kWhitColor;
                          });
                        },
                        child: Text(
                          "Tous",
                          style: TextStyle(color: c11),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: c2,
                          primary: c22,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.active;
                            c11 = c2 = c33 = c44 = kSecondryColor;
                            c1 = c22 = c3 = c4 = kWhitColor;
                          });
                        },
                        child: Text(
                          "Actif",
                          style: TextStyle(
                            color: c22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: c3,
                          primary: c33,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.holon;
                            c11 = c22 = c3 = c44 = kSecondryColor;
                            c1 = c2 = c33 = c4 = kWhitColor;
                          });
                        },
                        child: Text(
                          "En attente",
                          style: TextStyle(
                            color: c33,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: c4,
                          primary: c44,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.blocked;
                            c11 = c22 = c33 = c4 = kSecondryColor;
                            c1 = c2 = c3 = c44 = kWhitColor;
                          });
                        },
                        child: Text(
                          "bloqué",
                          style: TextStyle(
                            color: c44,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ]),
              ),
            ),
            getCustomContainer(),
          ],
        ),
        //  bottomNavigationBar: bottomNavigationBarAdmin(),
      ),
    );
  }
}

class getByDateMovie extends StatefulWidget {
  const getByDateMovie({Key? key}) : super(key: key);

  @override
  _getByDateMovieState createState() => _getByDateMovieState();
}

class _getByDateMovieState extends State<getByDateMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data'),
    );
  }
}

class getAll extends StatefulWidget {
  const getAll({Key? key}) : super(key: key);

  @override
  _getAllState createState() => _getAllState();
}

class _getAllState extends State<getAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CardAgent(
            nameFc: 'Accepter',
            color: kGreenColor,
            Backgroundcolor: kLightYellowColor,
          ),
          CardAgent(
            nameFc: 'Bloquer',
            color: kPrimaryColor,
            Backgroundcolor: kLightBlueColor,
          ),
          CardAgent(
            nameFc: 'Debloquer',
            color: kPurpleColor,
            Backgroundcolor: kLightPurpleColor,
          ),
        ],
      ),
    );
  }
}

class getActive extends StatefulWidget {
  const getActive({Key? key}) : super(key: key);

  @override
  _getActiveState createState() => _getActiveState();
}

class _getActiveState extends State<getActive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CardAgent(
            nameFc: 'Bloquer',
            color: kPrimaryColor,
            Backgroundcolor: kLightBlueColor,
          ),
          CardAgent(
            nameFc: 'Bloquer',
            color: kPrimaryColor,
            Backgroundcolor: kLightBlueColor,
          ),
          CardAgent(
            nameFc: 'Bloquer',
            color: kPrimaryColor,
            Backgroundcolor: kLightBlueColor,
          ),
        ],
      ),
    );
  }
}

class getholdon extends StatefulWidget {
  const getholdon({Key? key}) : super(key: key);

  @override
  _getholdonState createState() => _getholdonState();
}

class _getholdonState extends State<getholdon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CardAgent(
            nameFc: 'Accepter',
            color: kGreenColor,
            Backgroundcolor: kLightYellowColor,
          ),
          CardAgent(
            nameFc: 'Accepter',
            color: kGreenColor,
            Backgroundcolor: kLightYellowColor,
          ),
          CardAgent(
            nameFc: 'Accepter',
            color: kGreenColor,
            Backgroundcolor: kLightYellowColor,
          ),
        ],
      ),
    );
  }
}

class getBlocked extends StatefulWidget {
  const getBlocked({Key? key}) : super(key: key);

  @override
  _getBlockedState createState() => _getBlockedState();
}

class _getBlockedState extends State<getBlocked> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CardAgent(
            nameFc: 'Debloquer',
            color: kPurpleColor,
            Backgroundcolor: kLightPurpleColor,
          ),
          CardAgent(
            nameFc: 'Debloquer',
            color: kPurpleColor,
            Backgroundcolor: kLightPurpleColor,
          ),
          CardAgent(
            nameFc: 'Debloquer',
            color: kPurpleColor,
            Backgroundcolor: kLightPurpleColor,
          ),
        ],
      ),
    );
  }
}

class CardAgent extends StatefulWidget {
  final String nameFc;
  final Color color;
  final Color Backgroundcolor;

  const CardAgent(
      {Key? key,
      required this.nameFc,
      required this.color,
      required this.Backgroundcolor})
      : super(key: key);

  @override
  _CardAgentState createState() => _CardAgentState();
}

class _CardAgentState extends State<CardAgent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.Backgroundcolor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: kLightGreyColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                RowText(champ1: 'Ben Ali sabeur ', champ2: ' '),
                RowText(champ1: 'Telephone : ', champ2: '58 92 76 76'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      flex: 2,
                      child: TextButtonCrt(
                        BackgroundColor: kSecondryColor,
                        f: () {},
                        myText: 'Appeler',
                        TextColor: kWhitColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButtonCrt(
                        BackgroundColor: widget.color,
                        f: () {},
                        myText: widget.nameFc,
                        TextColor: kWhitColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
