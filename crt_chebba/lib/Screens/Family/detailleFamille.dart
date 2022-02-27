import 'package:crt_chebba/Screens/dons/donation_card.dart';
import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detailleFamille extends StatefulWidget {
  const detailleFamille({Key? key, required this.theFamily}) : super(key: key);
  final Family theFamily;
  @override
  _detailleFamilleState createState() => _detailleFamilleState();
}

class _detailleFamilleState extends State<detailleFamille>
    with SingleTickerProviderStateMixin {
  String _thevalue = "parent";

  Widget getResult(int info) {
    switch (info) {
      case 0:
        return InfoParent(f: widget.theFamily);
      case 1:
        return InfoEnfant(f: widget.theFamily);
      case 2:
        return FamilyDescription(f: widget.theFamily);
      default:
        return InfoParent(f: widget.theFamily);
    }
  }

  int? groupValue = 0;

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.red,
        title: Text("Famille :" + widget.theFamily.familyName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RaisedButton(
              elevation: 5,
              onPressed: () async {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new dons(familyId: widget.theFamily.familyName)));
              },
              padding: EdgeInsets.all(2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.green,
              child: Text(
                "detail dons",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Localisation:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Map here"),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white24,
              ),
              child: Expanded(
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                  controller: _tabController,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2.5, color: Colors.red),
                    ),
                  ),
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.blue,
                  tabs: [
                    Text("Parants",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                    Text("Enfants",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                    Text("Endroit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: getResult(groupValue!),
                      ),
                    ),
                    Row(
                      children: [Dons()],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget choiceInfo(String info) {
  return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                //  bottom: BorderSide(width: 2.0, color: Colors.red),
                )),
        child: ListTile(
          title: Center(
            child: Text(info,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )),
          ),
        ),
      ),
      flex: 1);
}

Widget InfoParent({required Family f}) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('f.nomPere',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('f.nomPere',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('f.nomPere',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
      ],
    ),
  );
}

Widget InfoEnfant({required Family f}) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nombre Enfants: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('5',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Nom Pere:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10,
            ),
            Text('f.nomPere',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ],
        ),
      ],
    ),
  );
}

Widget Dons() {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2))),
    width: 150,
    child: Center(
      child: FlatButton(
        height: 50,
        onPressed: () {},
        textColor: Colors.white,
        color: Colors.red,
        child: Row(
          children: [
            Icon(Icons.clean_hands_rounded),
            SizedBox(
              width: 10,
            ),
            Text(
              'Les Dons',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget FamilyDescription({required Family f}) {
  return Container(
    child: Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    ),
  );
}
