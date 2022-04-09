import 'package:cloud_firestore/cloud_firestore.dart';

class Family {
  String familyName = '';
  String familyID = '';
  String familyStatus = '';
  bool archived = false;

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

  int nbChildren = 0;
  String childrenInfo = '';

  String familyLocation = '';
  String IdQuartier = '';
  String IDMap = '';

  String RQs = '';

  Family() {
    familyName = 'empty';
    familyID = 'empty';
    archived = false;
    familyStatus = 'empty';

    fatherFirstName = 'empty';
    fatherLastName = '';
    fatherCIN = '';
    fatherPhone = '';
    fatherBirthDate = DateTime(2021);
    FatherJob = '';

    motherFirstName = '';
    motherLastName = '';
    motherCIN = '';
    motherPhone = '';
    motherBirthDate = DateTime(2021);
    motherJob = '';

    nbChildren = 0;
    childrenInfo = '';

    familyLocation = '';
    IdQuartier = '';
    IDMap = '';

    RQs = '';
  }

  Family.fill({required this.familyName});
  Family.fromJSON(Map<String, dynamic> map) {
    familyName = map['familyName'] ?? '';
    familyID = map['familyID'] ?? '';
    archived = map['archived'] ?? false;
    familyStatus = map['familyStatus'] ?? '';

    fatherFirstName = map['fatherFirstName'] ?? '';
    fatherLastName = map['fatherLastName'] ?? '';
    fatherCIN = map['fatherCIN'] ?? '';
    fatherPhone = map['fatherPhone'] ?? '';
    fatherBirthDate =
        DateTime.parse(map['fatherBirthDate'].toDate().toString());
    //   new DateTime.fromMicrosecondsSinceEpoch( as Timestamp * 1000);

    FatherJob = map['fatherJob'] ?? '';

    motherFirstName = map['motherFirstName'] ?? '';
    motherLastName = map['motherLastName'] ?? '';
    motherCIN = map['motherCIN'] ?? '';
    motherPhone = map['motherPhone'] ?? '';
    motherBirthDate =
        DateTime.parse(map['motherBirthDate'].toDate().toString());
    //  new DateTime.fromMicrosecondsSinceEpoch(map['motherBirthDate'] * 1000);
    motherJob = map['motherJob'] ?? '';

    nbChildren = map['nbChildren'] ?? -1;
    childrenInfo = map['childrenInfo'] ?? '';

    familyLocation = map['familyLocation'] ?? '';
    IdQuartier = map['IdQuartier'] ?? '';
    IDMap = map['mapId'] ?? '64P5+6CG La Chebba';

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
