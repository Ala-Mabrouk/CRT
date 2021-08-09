import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/Screens/dons/donation_card.dart';
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
    List<Family> families;
    // final args = ModalRoute.of(context)!.settings.arguments as String;

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
              DropdownButton(
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
                  // onChanged: (int value) {
                  //   setState(() {
                  //     _value = value;
                  //   });
                  // },
                  hint: Text("Tous")),
              StreamBuilder(
                stream: FamilyService().fetchFamiliesasStream(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    families = snapshot.data!.docs.map((doc) {
                      return Family.fromJSON(
                          doc.data() as Map<String, dynamic>);
                    }).toList();

                    return ListView.builder(
                      itemCount: families.length,
                      itemBuilder: (buildContext, index) =>
                          FamilyCard(f: families[index]),
                    );
                  } else {
                    return Text('fetching');
                  }
                },
              ),
              RaisedButton(
                  child: Text(
                    "add donations",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addDonations');
                  }),
              RaisedButton(
                  child: Text(
                    "add family",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/detailFamily');
                  })
            ],
          ),
        ),
      ),
    );
    // );
  }

  Widget FamilyCard({required Family f}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text('family of :' + f.familyName),
            subtitle: Text(
              'f.familyLocation',
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
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new dons(familyId: f.familyName)));
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
            title: Text('family of' + widget.theFamily.fatherName),
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
