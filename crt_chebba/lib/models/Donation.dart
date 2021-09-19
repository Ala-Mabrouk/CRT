class Donation {
  String donationID = '';
  String description = '';
  String Equipe = ''; //supposed to be list
  String publierPar = '';
  DateTime dateDonation = DateTime(2021);
  String idFamily = '';

  Donation() {}
  Donation.fromMap(Map donMap) {
    donationID = donMap['donationID'] ?? '';
    description = donMap['donationDescription'] ?? '';
    Equipe = donMap['equipe'] ?? '';
    publierPar = donMap['publierPar'] ?? '';
    dateDonation = DateTime.parse(donMap['donationDate'].toDate().toString());
    idFamily = donMap['familyId'] ?? '';
  }
}
