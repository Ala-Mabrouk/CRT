import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/IconButtonCRT.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAgentCRT.dart';
import 'package:crt_chebba/Screens/dons/ajouterDon.dart';
import 'package:crt_chebba/Screens/dons/donationsList.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:intl/intl.dart';

//new Widget:familly details : children and donnations ***( problem in btns)
class detailleFamille extends StatefulWidget {
  final Family selectedFamily;

  const detailleFamille({
    Key? key,
    required this.selectedFamily,
  }) : super(key: key);
  @override
  _detailleFamilleState createState() => _detailleFamilleState();
}

class _detailleFamilleState extends State<detailleFamille>
    with SingleTickerProviderStateMixin {
  String _thevalue = "parent";

  Widget getResult(int info) {
    switch (info) {
      case 0:
        return InfoParent(f: widget.selectedFamily);
      case 1:
        return InfoEnfant(f: widget.selectedFamily);
      case 2:
        return FamilyDescription(f: widget.selectedFamily);
      default:
        return InfoParent(f: widget.selectedFamily);
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
                nomFamille: widget.selectedFamily.familyName + 'name',
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
                                            familyId:
                                                widget.selectedFamily.familyID,
                                            familyName: widget
                                                    .selectedFamily.familyName +
                                                ' ' +
                                                widget.selectedFamily
                                                    .fatherLastName,
                                          ))),
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
                                            idfamily:
                                                widget.selectedFamily.familyID,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text(f.fatherFirstName + ' ' + f.fatherLastName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            Text("numero du pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text(f.fatherPhone,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            Text("date de naissance Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Text(
            new DateFormat("EEEE, d-MMMM-y")
                .format(f.fatherBirthDate)
                .toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        Row(
          children: [
            Text("Profession Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text(f.FatherJob,
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

Widget InfoEnfant({required Family f}) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Text("Nombre Enfants: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text(f.nbChildren.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            Text("Description:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Text(f.childrenInfo,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            )),
      ],
    ),
  );
}

Widget FamilyDescription({required Family f}) {
  return Container(
    child: Text(
      f.familyStatus + '\n' + f.RQs,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    ),
  );
}
