class Family {
  String familyName = '';
  String familyID = '';
  String familyStatus = '';

  String fatherFirstName = '';
  String fatherLastName = '';
  String fatherCIN = '';
  String fatherPhone = '';
  String fatherBirthDate = '';
  String FatherJob = '';

  String motherFirstName = '';
  String motherLastName = '';
  String motherCIN = '';
  String motherPhone = '';
  String motherBirthDate = '';
  String motherJob = '';

  String nbChildren = '';
  String childrenInfo = '';

  String familyLocation = '';
  String IdQuartier = '';

  String RQs = '';

  Family() {}
  Family.fill({required this.familyName});
  Family.fromJSON(Map<String, dynamic> map)
      : familyName = map['familyName'] ?? '';

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
