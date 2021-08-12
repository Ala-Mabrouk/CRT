import 'package:crt_chebba/Screens/dons/donation_card.dart';
import 'package:crt_chebba/Services/donationServices/donationsServices.dart';
import 'package:crt_chebba/models/Donation.dart';
import 'package:flutter/material.dart';

class AjouterDon extends StatefulWidget {
  const AjouterDon({Key? key, required this.idfamily}) : super(key: key);
  final String idfamily;
  @override
  _AjouterDonState createState() => _AjouterDonState();
}

class _AjouterDonState extends State<AjouterDon> {
  DonationService donService = DonationService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Donation don = Donation();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.red,
        title: Text("Ajouter don"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "Equipe :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              don.Equipe = value;
            },
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "Description :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          TextField(
            onChanged: (value) {
              don.description = value;
            },
            minLines: 2,
            maxLines: 8,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            elevation: 5,
            onPressed: () async {
              don.dateDonation = DateTime.now();
              don.idFamily = widget.idfamily;
              if (donService.addDonation(don) != Null) {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new dons(familyId: don.idFamily)));
              }
            },
            padding: EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.green,
            child: Text(
              "save don",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    ));
  }
}
