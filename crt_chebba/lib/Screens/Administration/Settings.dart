import 'package:crt_chebba/Screens/commun%20Screens/TextButtonCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/loading.dart';
import 'package:crt_chebba/Services/administrationServices/agentsManagment.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:flutter/material.dart';
import '../commun Screens/RowText.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

enum WidgetMarker { all, active, holon }
List<AgentCrt> allAgents = List.empty(growable: true);
List<AgentCrt> displayedAgents = List.empty(growable: true);
WidgetMarker selectedWidgetMarker = WidgetMarker.all;

class _SettingsState extends State<Settings> {
  Color c1 = kSecondryColor;
  Color c11 = kWhitColor;
  Color c2 = kWhitColor;
  Color c22 = kSecondryColor;
  Color c3 = kWhitColor;
  Color c33 = kSecondryColor;
  Color c4 = kWhitColor;
  Color c44 = kSecondryColor;

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.all:
        return getAll();
      case WidgetMarker.active:
        return getActive();
      case WidgetMarker.holon:
        return getholdon();

      default:
        return getAll();
    }
  }

  /*  Future<List<AgentCrt>> gettingAllAgents() async {
    var listAgents = await AgentManagement().fetchAgentsAsStream();
    return listAgents;
  } */

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[350],
          title: Text(
            'Les membres CRT Chebba',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kSecondryColor,
                fontSize: 15),
          ),
        ),
        body: StreamBuilder(
            stream: AgentManagement().fetchAgentsAsStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                allAgents = snapshot.data as List<AgentCrt>;
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: c1,
                                primary: c11,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedWidgetMarker = WidgetMarker.all;
                                  c1 = c22 = c33 = c44 = kSecondryColor;
                                  c11 = c2 = c3 = c4 = kWhitColor;
                                });
                              },
                              child: Text(
                                "Tous",
                                style: TextStyle(color: c11),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: c2,
                                primary: c22,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedWidgetMarker = WidgetMarker.active;
                                  c11 = c2 = c33 = c44 = kSecondryColor;
                                  c1 = c22 = c3 = c4 = kWhitColor;
                                });
                              },
                              child: Text(
                                "Actif",
                                style: TextStyle(
                                  color: c22,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: c3,
                                primary: c33,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedWidgetMarker = WidgetMarker.holon;
                                  c11 = c22 = c3 = c44 = kSecondryColor;
                                  c1 = c2 = c33 = c4 = kWhitColor;
                                });
                              },
                              child: Text(
                                "En attente / Bloqué",
                                style: TextStyle(
                                  color: c33,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ]),
                    ),
                    getCustomContainer(),
                  ],
                );
              }
              return Loding();
            }),
        //  bottomNavigationBar: bottomNavigationBarAdmin(),
      ),
    );
  }
}

class getAll extends StatefulWidget {
  const getAll({Key? key}) : super(key: key);

  @override
  _getAllState createState() => _getAllState();
}

class _getAllState extends State<getAll> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: allAgents.length,
          itemBuilder: (BuildContext context, int index) {
            String tempEtat = "";
            switch (allAgents[index].isConfirmed) {
              case true:
                tempEtat = 'Actif';
                break;
              case false:
                tempEtat = 'notConfirmed';
                break;
              default:
            }

            return CardAgent(etat: tempEtat, ag: allAgents[index]);
          }),
    );
  }
}

class getActive extends StatefulWidget {
  const getActive({Key? key}) : super(key: key);

  @override
  _getActiveState createState() => _getActiveState();
}

class _getActiveState extends State<getActive> {
  @override
  Widget build(BuildContext context) {
    //filter the list
    List<AgentCrt> activeAg =
        allAgents.where((ag) => ag.isConfirmed == true).toList();

    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: activeAg.length,
          itemBuilder: (BuildContext context, int index) {
            return CardAgent(etat: 'Actif', ag: activeAg[index]);
          }),
    );
  }
}

class getholdon extends StatefulWidget {
  const getholdon({Key? key}) : super(key: key);

  @override
  _getholdonState createState() => _getholdonState();
}

class _getholdonState extends State<getholdon> {
  List<AgentCrt> holdonAg =
      allAgents.where((ag) => ag.isConfirmed == false).toList();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: holdonAg.length,
          itemBuilder: (BuildContext context, int index) {
            return CardAgent(etat: 'notConfirmed', ag: holdonAg[index]);
          }),
    );
  }
}

class CardAgent extends StatefulWidget {
  final String etat;

  final AgentCrt ag;

  const CardAgent({Key? key, required this.etat, required this.ag})
      : super(key: key);

  @override
  _CardAgentState createState() => _CardAgentState();
}

class _CardAgentState extends State<CardAgent> {
  Color bgColor = kGreyColor;
  Color bgBtnColor = kGreyColor;
  String textFunction = "kGreyColor";

  @override
  Widget build(BuildContext context) {
    switch (widget.etat) {
      case "bloquer":
        {
          bgColor = kLightPurpleColor;
          bgBtnColor = kPurpleColor;
          textFunction = "Debloquer";
          break;
        }
      case "notConfirmed":
        {
          bgColor = kLightYellowColor;
          bgBtnColor = kGreenColor;
          textFunction = "Accepter";
          break;
        }
      case "Actif":
        {
          bgColor = kLightBlueColor;
          bgBtnColor = kPrimaryColor;
          textFunction = "Bloquer";
          break;
        }

      default:
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: kLightGreyColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                RowText(
                    champ1: widget.ag.name + ' ' + widget.ag.lastName,
                    champ2: ' '),
                RowText(champ1: 'Telephone : ', champ2: widget.ag.phone),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      flex: 2,
                      child: TextButtonCrt(
                        BackgroundColor: kSecondryColor,
                        f: ()  {
                          var FlutterPhoneDirectCaller;
                          FlutterPhoneDirectCaller.callNumber(
                                        widget.ag.phone);
                           
                        },
                        myText: 'Appeler',
                        TextColor: kWhitColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButtonCrt(
                        BackgroundColor: bgBtnColor,
                        f: () {
                          switch (widget.etat) {
                            case "notConfirmed":
                              {
                                print("going to activate");
                                AgentManagement()
                                    .activateAgent(widget.ag.agentId);
                                break;
                              }
                            case "Actif":
                              {
                                print("going to block");
                                AgentManagement().blockAgent(widget.ag.agentId);
                                break;
                              }

                            default:
                          }
                          setState(() {
                            //selectedWidgetMarker = WidgetMarker.all;
                          });
                        },
                        myText: textFunction,
                        TextColor: kWhitColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
