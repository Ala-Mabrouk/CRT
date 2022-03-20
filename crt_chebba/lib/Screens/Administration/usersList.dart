import 'package:crt_chebba/Screens/Family/detailleFamille.dart';
import 'package:crt_chebba/Services/administrationServices/agentsManagment.dart';
import 'package:crt_chebba/constants/constants.dart';
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

  //the wanted function
  Future thefunc(TypeDisplay val) async {
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
  void initState() {
    //get all saved agents in database
    thefunc(TypeDisplay.All);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 60,
                color: kLightGreyColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 10),
                      // iconAppBar(
                      //   color: kSecondryColor,
                      //   icon: Icons.arrow_back_ios_new_outlined,
                      // ),
                      Text(
                        'Les dons :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kSecondryColor),
                      ),
                      Text(
                        'Foulene Ben Foulene ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: kSecondryColor),
                      ),
                      // iconAppBar(
                      //   color: kGreenColor,
                      //   icon: Icons.phone, onPress: null,
                      // ),
                      SizedBox(width: 10),
                    ]),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => detailleFamille()));
                  },
                  child: Text('test')),
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
      //   bottomNavigationBar: BottumNavigationBar(),
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
