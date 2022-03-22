import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/dons/ajouterDon.dart';

import 'package:crt_chebba/Services/donationServices/donationsServices.dart';
import 'package:crt_chebba/models/Donation.dart';
import 'package:flutter/material.dart';

import 'donDetaille.dart';

//new widget:list of donnation of a specific family ***done !
class dons extends StatefulWidget {
  const dons({Key? key, required this.familyId, required this.familyName})
      : super(key: key);
  final String familyId;
  final String familyName;
  @override
  _donsState createState() => _donsState();
}

class _donsState extends State<dons> {
  @override
  Widget build(BuildContext context) {
    List<Donation?> donations;
    return Scaffold(
      //  bottomNavigationBar: bottomNavigationBarAgent(),
      body: SafeArea(
        child: Column(
          children: [
            AppBarCrt(info: 'Les dons de', nomFamille: widget.familyName),
            Expanded(
              child: StreamBuilder(
                stream: DonationService()
                    .fetchDonationsOfFamilyStream(widget.familyId),
                builder: (context, AsyncSnapshot<List<Donation?>> snapshot) {
                  if (snapshot.hasData) {
                    donations = snapshot.data!.toList();
                    return ListView.builder(
                      itemCount: donations.length,
                      itemBuilder: (buildContext, index) =>
                          donDetaille(don: donations[index]!),
                      // itemdon(d: donations[index]!),
                    );
                  } else {
                    return Text('fetching');
                  }
                },
              ),
            ),
          ],
        ),
      ),
      // ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AjouterLeDon(
                        idfamily: widget.familyId,
                      )));
        },
        tooltip: 'ajouter don',
        child: Icon(Icons.add),
      ), //
    );
  }
}

/* Widget itemdon({required Donation d}) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Date: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 10,
              ),
              Text('24-02-2020',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Equipe: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 10,
              ),
              Text('foulen floulen foulen',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Description: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ],
          ),
          Container(
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () {
                  // Perform some action
                },
                child: Row(
                  children: [
                    Text('Ajouter par : ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(d.publierPar),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
 */