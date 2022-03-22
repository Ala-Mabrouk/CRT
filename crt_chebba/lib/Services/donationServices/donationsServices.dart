import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/Donation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonationService {
  final CollectionReference donationsCollection =
      FirebaseFirestore.instance.collection("CRT_Donation");

//get Donnation stream of a specific family
  late List<Donation?> myDonations;
  Stream<List<Donation?>> fetchDonationsOfFamilyStream(String id) {
    return donationsCollection.snapshots().map((doc) {
      myDonations = doc.docs.map((e) {
        Map myDocData = e.data() as Map<String, dynamic>;
        print("******************************");
        print('the comparaison is ' +
            (myDocData['familyId'].toString() == id.toString()).toString());
        if ((myDocData['familyId'].toString() == id.toString()).toString() ==
            'true') {
          print("in the if and donnation is");
          print(myDocData);
          return Donation.fromMap(myDocData);
        }
      }).toList();
      myDonations.removeWhere((value) => value == null);
      print("the donations are");
      print(myDonations);
      return myDonations;
    });
  }

  //get donation details

  Future getDonationDetails(String _donationID) async {
    return await donationsCollection.doc(_donationID).snapshots();
  }

  //adding donnation

  Future addDonation(Donation _donation) async {
    //need more working on
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _donation.donationID = getRandomID(16);

    _donation.publierPar = prefs.getString('userEmail').toString();

    return await donationsCollection
        .doc(_donation.donationID)
        .set({
          'donationID': _donation.donationID,
          'donationDescription': _donation.description,
          'equipe': _donation.Equipe,
          'publierPar': _donation.publierPar,
          'donationDate': _donation.dateDonation,
          'familyId': _donation.idFamily,
        })
        .whenComplete(() => print("donation item added to the database"))
        .catchError((e) => print(e));
  }

  //updating family

  Future updateFamily(Donation _donation) async {
    return await donationsCollection
        .doc(_donation.donationID)
        .update({
          'donationID': _donation.donationID,
          'donationDescription': _donation.description,
          'equipe': _donation.Equipe,
          'publierPar': _donation.publierPar,
          'donationDate': _donation.dateDonation,
        })
        .whenComplete(() => print("donation is updated in the database"))
        .catchError((e) => print(e));
  }

  //delete donation
  Future deleteDonation(String _donationId) async {
    //
    //get the family data and move them to the archive
    //
    //save the data
    //delete the document from CRT_Famliy collection
    //save the data in the archive collection

    return await donationsCollection.doc(_donationId).snapshots();
  }

  // random id generator
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomID(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
