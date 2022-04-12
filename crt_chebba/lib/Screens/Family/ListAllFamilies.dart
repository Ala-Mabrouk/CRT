import 'package:crt_chebba/Screens/Family/add_family.dart';
import 'package:crt_chebba/Screens/Family/detailleFamille.dart';
import 'package:crt_chebba/Screens/Family/updateFamily.dart';
import 'package:crt_chebba/Screens/commun%20Screens/CustomDropDown.dart';
import 'package:crt_chebba/Screens/commun%20Screens/HomeAppBar.dart';
import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/Screens/commun%20Screens/loading.dart';
import 'package:crt_chebba/Services/familyServices/familyServices.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAllFamilies extends StatefulWidget {
  static const routeName = '/Home';
  @override
  _ListAllFamiliesState createState() => _ListAllFamiliesState();
}

class _ListAllFamiliesState extends State<ListAllFamilies> {
  List<Family>? families = [];
  List<Family> displayedList = [];
  int _value = 0;
  bool isAdmin = false;
  // bool checked = false;
  showAlertDialog(BuildContext context, String textid, String fname) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
            '! Attention !',
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vous êtes sur le point de Supprimer la famille de ' +
                    fname +
                    '!!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Annuler'),
                onPressed: () async {
                  print('alert dissmiss');

                  Navigator.pop(context);
                  setState(() {});
                }),
            TextButton(
              child: const Text(
                'Supprimer',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                print('Famille archiver !!!');
                FamilyService().archiveFamily(textid);
                Navigator.pop(context);
                setState(() {});
                //(context,MaterialPageRoute(builder: (context) => const signIn()));
              },
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // thefunc(_value);
/*     checkLoged();
    if (!checked) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => new login()),
          (route) => false);
    } */
    super.initState();
    SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            isAdmin = prefValue.getBool('isAdmin') ?? false;
          })
        });
  }

/*   void checkLoged() {
    FutureBuilder(
      future: AuthenticationService().autoAthenticate(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          AgentCrt ag = snapshot.data as AgentCrt;
          if (ag.isConfirmed) {
            checked = true;
            // return true;
          } else {
            checked = false;
            AuthenticationService().logout();
          }
        }
        return Container();
      },
    );
  } */

//the wanted function
  /*  Future<void> thefunc(int val) async {
    await FamilyService().fetchFamilies().then((value) => families = value);
    if (val == 0) {
      displayedList = families!;
    } else {
      displayedList = families!
          .where((element) => element.IdQuartier == val.toString())
          .toList();
    }
    setState(() {});
  } */

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
                          // await thefunc(_value);
                          setState(() {});
                        });
                      },
                      hint: Text("Selon le quartier")),
                ),
              ),
            ),
            FutureBuilder(
                future: FamilyService().fetchFamilies(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    families = snapshot.data as List<Family>?;
                    if (_value == 0) {
                      displayedList = families!;
                    } else {
                      displayedList = families!
                          .where((element) =>
                              element.IdQuartier == _value.toString())
                          .toList();
                    }
                    //setState(() {});

                    return Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: displayedList.length,
                            itemBuilder: (BuildContext context, Index) {
                              if (!displayedList[Index].archived)
                                return FamilyCard(f: displayedList[Index]);
                              return SizedBox();
                            }),
                      ),
                    );
                  }
                  return Loding();
                }),
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
                              f.familyName,
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
                        //selon le role on change l'affichage
                        Container(
                          child: (!isAdmin)
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor.withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        detailleFamille(
                                                          selectedFamily: f,
                                                        )));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 0),
                                            child: const Text(
                                              'Voir Details',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: kGreenColor.withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        detailleFamille(
                                                          selectedFamily: f,
                                                        )));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 0),
                                            child: const Text(
                                              'Details',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        alignment: AlignmentDirectional.center,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color:
                                              kSecondryColor.withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        updateFamily(
                                                          toUpdateFamily: f,
                                                        )));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 0),
                                            child: const Text(
                                              'Modifier',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor.withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            showAlertDialog(context, f.familyID,
                                                f.familyName);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7, vertical: 0),
                                            child: const Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        SizedBox(
                          height: 5,
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
