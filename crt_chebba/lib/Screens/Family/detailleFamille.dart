import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/IconButtonCRT.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAgentCRT.dart';
import 'package:crt_chebba/Screens/dons/ajouterDon.dart';
import 'package:crt_chebba/Screens/dons/donationsList.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

//new Widget:familly details : children and donnations ***( problem in btns)
class detailleFamille extends StatefulWidget {
  const detailleFamille({
    Key? key,
  }) : super(key: key);
  @override
  _detailleFamilleState createState() => _detailleFamilleState();
}

class _detailleFamilleState extends State<detailleFamille>
    with SingleTickerProviderStateMixin {
  String _thevalue = "parent";
  Family theFamily = Family();
  Widget getResult(int info) {
    switch (info) {
      case 0:
        return InfoParent(f: theFamily);
      case 1:
        return InfoEnfant(f: theFamily);
      case 2:
        return FamilyDescription(f: theFamily);
      default:
        return InfoParent(f: theFamily);
    }
  }

  int? groupValue = 0;

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCrt(
                nomFamille: theFamily.familyName + 'name',
                info: 'La Famille de',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Localisation:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Map here"),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white24,
                ),
                child: Expanded(
                  child: TabBar(
                    onTap: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    },
                    controller: _tabController,
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2.5, color: Colors.red),
                      ),
                    ),
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.blue,
                    tabs: [
                      Text("Parants",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kSecondryColor,
                          )),
                      Text("Enfants",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kSecondryColor,
                          )),
                      Text("Endroit",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kSecondryColor,
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: getResult(groupValue!),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IconButtonCRT(
                              BackgroundColor: kPrimaryColor,
                              f: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => dons(
                                          familyId: theFamily.familyName))),
                              icon: LineIcons.handHoldingHeart,
                              myText: 'Les dons',
                              TextColor: kWhitColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: IconButtonCRT(
                              BackgroundColor: kSecondryColor,
                              f: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AjouterLeDon(
                                            idfamily: theFamily.familyID,
                                          ))),
                              icon: LineIcons.handHoldingHeart,
                              myText: 'Ajouter don',
                              TextColor: kWhitColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //  bottomNavigationBar: bottomNavigationBarAgent(),
    );
  }
}

Widget choiceInfo(String info) {
  return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                //  bottom: BorderSide(width: 2.0, color: Colors.red),
                )),
        child: ListTile(
          title: Center(
            child: Text(info,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )),
          ),
        ),
      ),
      flex: 1);
}

Widget InfoParent({required Family f}) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('f.nomPere',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('f.nomPere',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('f.nomPere',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
      ],
    ),
  );
}

Widget InfoEnfant({required Family f}) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nombre Enfants: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('5',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('f.nomPere',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
      ],
    ),
  );
}

Widget FamilyDescription({required Family f}) {
  return Container(
    child: Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    ),
  );
}
