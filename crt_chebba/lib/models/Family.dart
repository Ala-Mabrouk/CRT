import 'package:cloud_firestore/cloud_firestore.dart';

class Family {
  String familyName = '';
  String familyID = '';
  String familyStatus = '';

  String fatherFirstName = '';
  String fatherLastName = '';
  String fatherCIN = '';
  String fatherPhone = '';
  DateTime fatherBirthDate = DateTime(2021);
  String FatherJob = '';

  String motherFirstName = '';
  String motherLastName = '';
  String motherCIN = '';
  String motherPhone = '';
  DateTime motherBirthDate = DateTime(2021);
  String motherJob = '';

  String nbChildren = '';
  String childrenInfo = '';

  String familyLocation = '';
  String IdQuartier = '';

  String RQs = '';

  Family() {}
  Family.fill({required this.familyName});
  Family.fromJSON(Map<String, dynamic> map) {
    familyName = map['familyName'] ?? '';
    familyID = map['familyID'] ?? '';
    familyStatus = map['familyStatus'] ?? '';

    fatherFirstName = map['fatherFirstName'] ?? '';
    fatherLastName = map['fatherLastName'] ?? '';
    fatherCIN = map['fatherCIN'] ?? '';
    fatherPhone = map['fatherPhone'] ?? '';
    fatherBirthDate =
        DateTime.parse(map['fatherBirthDate'].toDate().toString());
    //   new DateTime.fromMicrosecondsSinceEpoch( as Timestamp * 1000);

    FatherJob = map['FatherJob'] ?? '';

    motherFirstName = map['motherFirstName'] ?? '';
    motherLastName = map['motherLastName'] ?? '';
    motherCIN = map['motherCIN'] ?? '';
    motherPhone = map['motherPhone'] ?? '';
    motherBirthDate =
        DateTime.parse(map['motherBirthDate'].toDate().toString());
    //  new DateTime.fromMicrosecondsSinceEpoch(map['motherBirthDate'] * 1000);
    motherJob = map['motherJob'] ?? '';

    nbChildren = map['nbChildren'] ?? '';
    childrenInfo = map['childrenInfo'] ?? '';

    familyLocation = map['familyLocation'] ?? '';
    IdQuartier = map['IdQuartier'] ?? '';

    RQs = map['RQs'] ?? '';
  }

  static Family fromMap(dynamic map) {
    return Family.fill(
      familyName: map['familyName'] as String,
      // name: map['name'] as String,
      // lastName: map['lastName'] as String,
      // birthDate: map['birthDate'].toString(),
      // phone: map['phone'] as String,
      // email: map['email'] as String,
      // isAdmin: map['isAdmin'] as bool,
      // isConfirmed: map['isConfirmed'] as bool,
    );
  }

  //there is suposed to have a list of donations  ??!!!!!
}
