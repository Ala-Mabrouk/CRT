import 'dart:async';

import 'package:crt_chebba/Screens/Family/add_family.dart';
import 'package:crt_chebba/Screens/Family/detailleFamille.dart';
import 'package:crt_chebba/Screens/commun%20Screens/NavigationBar.dart';
import 'package:crt_chebba/Screens/commun%20Screens/loading.dart';

import 'package:crt_chebba/Services/familyServices/familyServices.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("CRT CHEBBA"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("ALL"),
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

            // Text('******************************'),

            // child: StreamBuilder(
            //   stream: FamilyService().fetchFamiliesasStream(),
            //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.hasData) {
            //       families = snapshot.data!.docs.map((doc) {
            //         return Family.fromJSON(
            //             doc.data() as Map<String, dynamic>);
            //       }).toList();
            //       displayedList = families!;
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: displayedList.length,
            //         itemBuilder: (buildContext, index) =>
            //             FamilyCard(f: displayedList[index]),
            //       );
            //     } else {
            //       return Text('fetching');
            //     }
            //   },
            // ),
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
      bottomNavigationBar: BottumNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new addFamily()));
        },
        tooltip: 'ajouter don',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget FamilyCard({required Family f}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text('family of :' + f.familyName),
            subtitle: Text(
              'location' + f.familyLocation,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Eatat famille :' + f.familyStatus,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () {
                  // Perform some action

                  print(f.fatherLastName);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new detailleFamille(theFamily: f)));
                },
                child: const Text('Voir Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
            title: Text('family of' + widget.theFamily.familyName),
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
}
