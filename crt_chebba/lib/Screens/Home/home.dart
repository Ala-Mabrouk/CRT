import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    int _value = 1;
    String _dropDownValue;

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("CRT CHEBBA"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
            itemdon(),
            itemdon(),
          ],
        ),
      ),
    ));
  }
}

class itemdon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: const Text('Famille Ben Flene Foulane'),
            subtitle: Text(
              '5 rue ibn .....',
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
