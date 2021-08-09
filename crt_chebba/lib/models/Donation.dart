class Donation {
  String donationID = '';
  String description = '';
  String Equipe = ''; //supposed to be list
  String publierPar = '';
  DateTime dateDonation = DateTime(2021);
  String idFamily = '';

  Donation() {}
  Donation.fromMap(Map don) : donationID = don['donationID'] ?? '';
}
