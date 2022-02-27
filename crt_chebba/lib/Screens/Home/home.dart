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
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Tous"),
                      value: 0,
                    ),
                    DropdownMenuItem(
                      child: Text("quartier Bassatine"),
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
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addFamily()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget FamilyCard({required Family f}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kLightGreyColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                child: Icon(Icons.people),
              ),
              SizedBox(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Famille: ",
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            f.familyName,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
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
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            f.familyLocation,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  detailleFamille(theFamily: f)));
                    },
                    child: const Text('Voir Details'),
                  ),
                ],
              ),
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
