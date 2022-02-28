import 'dart:async';
import 'package:crt_chebba/Screens/Family/add_family.dart';
import 'package:crt_chebba/Screens/Family/detailleFamille.dart';
import 'package:crt_chebba/Screens/commun%20Screens/HomeAppBar.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAgentCRT.dart';
import 'package:crt_chebba/Services/familyServices/familyServices.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  static const routeName = '/Home';
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
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
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(),
            Container(
              decoration: BoxDecoration(
                color: kGreyColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: kLightGreyColor,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
                child: DropdownButton(
                    underline: Container(
                      height: 1,
                      color: Colors.transparent,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 40,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(9),
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                          child: Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                              child: Text("Tous"),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1)))),
                        ),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                            child: Text("quartier Bassatine"),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 1)))),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Sidi Salem"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("garaa tabel + beb nian"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("Henchir Moussa"),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("wahab"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("El marssa"),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text("quartier charquia"),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text("Dowira"),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text("centre Ville"),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text("rue de tbarna + hratla"),
                        value: 10,
                      ),
                      DropdownMenuItem(
                        child: Text("El frahta"),
                        value: 11,
                      ),
                      DropdownMenuItem(
                        child: Text("exterieur de la Chebba , rue mahdia"),
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
      bottomNavigationBar: bottomNavigationBarAgent(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addFamily()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget FamilyCard({required Family f}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kLightGreyColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 5, 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/family1Icon.png',
                fit: BoxFit.fill,
                height: 70,
                width: 80,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Famille: ",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          f.familyName,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.blue[900]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Adresse: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          f.familyLocation,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 160,
                        ),
                        RaisedButton(
                          child: const Text(
                            'Voir Details',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              side: BorderSide(color: kPrimaryColor)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        detailleFamille(theFamily: f)));
                          },
                        ),
                      ],
                    ),
                  ]),
            ],
          ),
        ),
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
