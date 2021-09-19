import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:crt_chebba/models/Family.dart';

class AgentManagement {
  final CollectionReference familiesCollection =
      FirebaseFirestore.instance.collection("CRT_Agents");

  Future<List<AgentCrt>> fetchAgentsAsStream() async {
    try {
      var myList = await familiesCollection.get().then((value) => value.docs
          .map((doc) => AgentCrt.fromMap(doc.data() as Map<String, dynamic>))
          .toList());

      return myList;
    } catch (e) {
      return List.empty();
    }
  }

//families stream
  Stream<List<Family>?> get Families {
    return familiesCollection.snapshots().map(listFamilyFromSnapShot);
  }

//list family from snapshot
  List<Family>? listFamilyFromSnapShot(QuerySnapshot snapshot) {
    var res = snapshot.docs.map((e) {
      Map<String, dynamic> docData = e.data() as Map<String, dynamic>;
      Family.fromMap(docData);
    }).toList() as List<Family>;
    return res;
  }

  //get family details

  Future getFamilyDetails(String _familyID) async {
    return await familiesCollection.doc(_familyID).snapshots();
  }
  //adding family

  Future addFamily(Family _family) async {
    _family.familyID = getRandomID(12);

    return await familiesCollection
        .doc(_family.familyID)
        .set({
          'familyID': _family.familyID,
          'familyName': _family.fatherLastName,
          'familyStatus': _family.familyStatus,
//
          'fatherFirstName': _family.fatherFirstName,
          'fatherLasttName': _family.fatherLastName,
          'fatherJob': _family.fatherLastName,
          'fatherCIN': _family.fatherCIN,
          'fatherPhone': _family.fatherPhone,
          'fatherBirthDate': _family.fatherBirthDate,

//

          'motherFirstName': _family.motherFirstName,
          'motherLastName': _family.motherLastName,
          'motherCIN': _family.motherCIN,
          'motherPhone': _family.motherPhone,
          'motherBirthDate': _family.motherBirthDate,
          'motherJob': _family.fatherLastName,
//
//

          'familyLocation': _family.familyLocation,
          'IdQuartier': _family.IdQuartier,
//
          'familyRQs': _family.RQs,
        })
        .whenComplete(() => print("family item added to the database"))
        .catchError((e) => print(e));
  }

  //updating family

  Future updateFamily(Family _family) async {
    return await familiesCollection
        .doc(_family.familyID)
        .update({
          'familyName': _family.fatherLastName,

          'fatherFirstName': _family.fatherFirstName,
          'fatherLasttName': _family.fatherLastName,

          'fatherCIN': _family.fatherCIN,
          'fatherPhone': _family.fatherPhone,
          'fatherBirthDate': _family.fatherBirthDate,
//

          'motherFirstName': _family.motherFirstName,
          'motherLastName': _family.motherLastName,
          'motherCIN': _family.motherCIN,
          'motherPhone': _family.motherPhone,
          'motherBirthDate': _family.motherBirthDate,
//
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