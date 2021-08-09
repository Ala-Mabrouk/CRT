import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/Family.dart';

class FamilyService {
  final CollectionReference familiesCollection =
      FirebaseFirestore.instance.collection("CRT_Family");

//family stream
  Stream<QuerySnapshot> fetchFamiliesasStream() {
    return familiesCollection.snapshots();
  }

//families stream
  Stream<List<Family>?> get Families {
    return familiesCollection.snapshots().map(listFamilyFromSnapShot);
  }

//list family from snapshot
  List<Family>? listFamilyFromSnapShot(QuerySnapshot snapshot) {
    snapshot.docs.map((e) {
      Map<String, dynamic> docData = e.data() as Map<String, dynamic>;
      return Family.fromMap(docData);
    }).toList();
  }

  //get family details

  Future getFamilyDetails(String _familyID) async {
    return await familiesCollection.doc(_familyID).snapshots();
  }
  //adding family

  Future addFamily(Family _family) async {
    _family.familyID = getRandomID(8);

    return await familiesCollection
        .doc(_family.familyID)
        .set({
          'familyID': _family.familyID,
          'fatherName': _family.fatherName,
          'fatherCIN': _family.fatherCIN,
          'fatherPhone': _family.fatherPhone,
//

          'motherName': _family.motherName,
          'motherCIN': _family.motherCIN,
          'motherPhone': _family.motherPhone,
//

          'familyLocation': _family.familyLocation,
          'IdQuartier': _family.IdQuartier,
        })
        .whenComplete(() => print("family item added to the database"))
        .catchError((e) => print(e));
  }

  //updating family

  Future updateFamily(Family _family) async {
    return await familiesCollection
        .doc(_family.familyID)
        .update({
          'familyID': _family.familyID,
          'fatherName': _family.fatherName,
          'fatherCIN': _family.fatherCIN,
          'fatherPhone': _family.fatherPhone,
//

          'motherName': _family.motherName,
          'motherCIN': _family.motherCIN,
          'motherPhone': _family.motherPhone,
//

          'familyLocation': _family.familyLocation,
          'IdQuartier': _family.IdQuartier,
        })
        .whenComplete(() => print("family is updated in the database"))
        .catchError((e) => print(e));
  }

  //delete family
  Future archiveFamily(String _familyID) async {
    //
    //get the family data and move them to the archive
    //
    //save the data
    //delete the document from CRT_Famliy collection
    //save the data in the archive collection

    return await familiesCollection.doc(_familyID).snapshots();
  }

  // random id generator
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomID(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
