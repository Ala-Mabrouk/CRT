import 'dart:async';
import 'package:crt_chebba/Screens/Family/add_family.dart';
import 'package:crt_chebba/Screens/Family/detailleFamille.dart';
import 'package:crt_chebba/Screens/commun%20Screens/CustomDropDown.dart';
import 'package:crt_chebba/Screens/commun%20Screens/HomeAppBar.dart';
import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAgentCRT.dart';
import 'package:crt_chebba/Services/familyServices/familyServices.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';

class ListAllFamilies extends StatefulWidget {
  static const routeName = '/Home';
  @override
  _ListAllFamiliesState createState() => _ListAllFamiliesState();
}

class _ListAllFamiliesState extends State<ListAllFamilies> {
  List<Family>? families = [];
  List<Family> displayedList = [];
  int _value = 0;

  @override
  void initState() {
    thefunc(_value);
    super.initState();
  }

//the wanted function
  Future<void> thefunc(int val) async {
    await FamilyService().fetchFamilies().then((value) => families = value);
    if (val == 0) {
      displayedList = families!;
    } else {
      displayedList = families!
          .where((element) => element.IdQuartier == val.toString())
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addFamily()));
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                  color: kGreyColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: kLightGreyColor,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: DropdownButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      iconSize: 40,
                      isExpanded: true,
                      isDense: true,
                      borderRadius: BorderRadius.circular(9),
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Tous',
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Quartier Bassatine',
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Sidi Salem',
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Garaa tabel + beb nian',
                          ),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Henchir Moussa',
                          ),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Wahab',
                          ),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'El marssa',
                          ),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Quartier charquia',
                          ),
                          value: 7,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Dowira',
                          ),
                          value: 8,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Centre Ville',
                          ),
                          value: 9,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Rue de tbarna + hratla',
                          ),
                          value: 10,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'El frahta',
                          ),
                          value: 11,
                        ),
                        DropdownMenuItem(
                          child: CustomDropDown(
                            info: 'Exterieur de la Chebba,rue Mahdia',
                          ),
                          value: 12,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() async {
                          _value = int.parse(value.toString());
                          value = _value;
                          await thefunc(_value);
                          setState(() {});
                        });
                      },
                      hint: Text("Selon le quartier")),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: displayedList.length,
                    itemBuilder: (BuildContext context, Index) {
                      return FamilyCard(f: displayedList[Index]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget FamilyCard({required Family f}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: kGreyColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: kLightGreyColor,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(Icons.people, size: 50),
                      ],
                    )),
                Expanded(
                  flex: 3,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Famille: ",
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              f.familyName + ' ' + f.fatherFirstName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowText(champ1: 'Adresse: ', champ2: f.familyLocation),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                detailleFamille()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 0),
                                    child: const Text(
                                      'Voir Details',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );

    /*  Column(
        children: [
          ListTile(
            title: Text('family of :' + f.familyName),
            subtitle: Text(
              'location: ' + f.familyLocation,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Etat famille :' + f.familyStatus,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detailleFamille(theFamily: f)));
                },
                child: const Text('Voir Details'),
              ),
            ],
          ),
        ],
      ), 
    );*/
  }

  onPressed() {}
}

/* 
class itemdon extends StatefulWidget {
  final Family theFamily;
  const itemdon({Key? key, required this.theFamily}) : super(key: key);

  @override
  _itemdonState createState() => _itemdonState();
}

class _itemdonState extends State<itemdon> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text('family of: ' + widget.theFamily.familyName),
            subtitle: Text(
              widget.theFamily.familyLocation,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Description : xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () {
                  // Perform some action
                },
                child: const Text('Voir Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }
} */
