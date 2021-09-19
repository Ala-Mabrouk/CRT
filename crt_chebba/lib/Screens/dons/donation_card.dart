import 'package:crt_chebba/Services/donationServices/donationsServices.dart';
import 'package:crt_chebba/models/Donation.dart';
import 'package:flutter/material.dart';

import 'add_donation.dart';

class dons extends StatefulWidget {
  const dons({Key? key, required this.familyId}) : super(key: key);
  final String familyId;
  @override
  _donsState createState() => _donsState();
}

class _donsState extends State<dons> {
  @override
  Widget build(BuildContext context) {
    List<Donation?> donations;
    print("the family looking for :" + widget.familyId);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red,
          title: Text("Les dons de" + widget.familyId),
          centerTitle: true,
        ),
        body:
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Column(children: [
            //     itemdon(),
            //     itemdon(),
            //   ]),
            // ),
            Container(
          child: StreamBuilder(
            stream:
                DonationService().fetchDonationsOfFamilyStream(widget.familyId),
            builder: (context, AsyncSnapshot<List<Donation?>> snapshot) {
              if (snapshot.hasData) {
                donations = snapshot.data!.toList();
                return ListView.builder(
                  itemCount: donations.length,
                  itemBuilder: (buildContext, index) =>
                      itemdon(d: donations[index]!),
                );
              } else {
                return Text('fetching');
              }
            },
          ),
        ),
        // ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new AjouterDon(
                          idfamily: widget.familyId,
                        )));
          },
          tooltip: 'ajouter don',
          child: Icon(Icons.add),
        ), //
      ),
    );
  }
}

Widget itemdon({required Donation d}) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        ListTile(
          title: Text('Date :' + d.dateDonation.toString()),
          subtitle: Text(
            'Equipe : ' + d.Equipe,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Description : ' + d.description,
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
              child: Text('ajouter par : ' + d.publierPar),
            ),
          ],
        ),
      ],
    ),
  );
}
