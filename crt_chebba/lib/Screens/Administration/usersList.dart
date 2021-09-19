import 'package:crt_chebba/Screens/commun%20Screens/NavigationBar.dart';
import 'package:crt_chebba/Services/administrationServices/agentsManagment.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:flutter/material.dart';

class AgentsList extends StatefulWidget {
  const AgentsList({Key? key}) : super(key: key);

  @override
  _AgentsListState createState() => _AgentsListState();
}

enum TypeDisplay { All, Active, Non_Active }

class _AgentsListState extends State<AgentsList> {
  List<AgentCrt> _agentsList = [];
  List<AgentCrt> _displayedList = [];
  TypeDisplay _typeDisplay = TypeDisplay.All;
  @override
  void initState() {
    //get all saved agents in database
    thefunc(TypeDisplay.All);
    super.initState();
  }

  //the wanted function
  Future<void> thefunc(TypeDisplay val) async {
    await AgentManagement()
        .fetchAgentsAsStream()
        .then((value) => _agentsList = value);

    switch (val) {
      case TypeDisplay.Active:
        _displayedList = _agentsList
            .where((element) => element.isConfirmed == true)
            .toList();

        break;
      case TypeDisplay.Non_Active:
        _displayedList = _agentsList
            .where((element) => element.isConfirmed == false)
            .toList();
        break;
      default:
        _displayedList = _agentsList;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: ListTile(
                        title: const Text('All'),
                        contentPadding: EdgeInsets.all(0),
                        leading: Radio(
                          value: TypeDisplay.All,
                          groupValue: _typeDisplay,
                          onChanged: (TypeDisplay? value) {
                            setState(() async {
                              _typeDisplay = value!;
                              await thefunc(_typeDisplay);
                            });
                          },
                        ),
                      ),
                      flex: 1),
                  Expanded(
                    child: ListTile(
                      title: const Text('Active'),
                      contentPadding: EdgeInsets.all(0),
                      leading: Radio(
                        value: TypeDisplay.Active,
                        groupValue: _typeDisplay,
                        onChanged: (TypeDisplay? value) {
                          setState(() async {
                            _typeDisplay = value!;
                            await thefunc(_typeDisplay);
                          });
                        },
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Non-Active'),
                      contentPadding: EdgeInsets.all(2),
                      leading: Radio(
                        value: TypeDisplay.Non_Active,
                        groupValue: _typeDisplay,
                        onChanged: (TypeDisplay? value) {
                          setState(() async {
                            _typeDisplay = value!;
                            await thefunc(_typeDisplay);
                          });
                        },
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _displayedList.length,
                      itemBuilder: (BuildContext context, Index) {
                        return AgentCard(agentCrt: _displayedList[Index]);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget AgentCard({required AgentCrt agentCrt}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(agentCrt.lastName),
            subtitle: Text(
              'email' + agentCrt.email,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Etat agent :' + agentCrt.isConfirmed.toString(),
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     new MaterialPageRoute(
                  //         builder: (context) =>
                  //             new detailleFamille(theFamily: f))
                  //             );
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
