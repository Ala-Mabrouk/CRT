import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/Screens/Family/add_family.dart';
import 'package:crt_chebba/Screens/Family/detailleFamille.dart';
import 'package:crt_chebba/Screens/commun%20Screens/NavigationBar.dart';
import 'package:crt_chebba/Screens/commun%20Screens/appBar.dart';

import 'package:crt_chebba/Services/familyServices/familyServices.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  static const routeName = '/Home';
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    int _value = 1;
    String _dropDownValue;
    List<Family>? families = null;
    List<Family> displayedList = List.empty();
    // final args = ModalRoute.of(context)!.settings.arguments as String;
    void filtredList(int val) {
      print('the quart' + val.toString());
      print(families);
      displayedList = families!
          .where((element) => element.IdQuartier == val.toString())
          .toList();
      print(displayedList);
      setState(() {});
    }

    return MaterialApp(
      home: Scaffold(
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
                      setState(() {
                        _value = int.parse(value.toString());
                        print('the quart' + _value.toString());
                        print(families);
                        displayedList = families!
                            .where((element) =>
                                element.IdQuartier == _value.toString())
                            .toList();
                        print(displayedList);
                        setState(() {});
                      });
                    },
                    hint: Text("Selon le quartier")),
              ),
              Container(
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
                  child: FutureBuilder(
                future: FamilyService().fetchFamiliesasStream(),
                builder: (context, AsyncSnapshot<List<Family>> snap) {
                  families = snap.data;
                  displayedList = families!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: displayedList.length,
                    itemBuilder: (buildContext, index) =>
                        FamilyCard(f: displayedList[index]),
                  );
                },
              )),
              Text('******************************'),
              new Expanded(
                  child: new ListView.builder(
                      itemCount: displayedList.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return FamilyCard(f: displayedList[Index]);
                      }))
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
