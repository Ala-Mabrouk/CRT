class AgentCrt {
  String agentId = '';
  String name = ' ';
  String lastName = '';
  String birthDate = '';
  String phone = '';
  String email = '';
  String password = '';
  bool isAdmin = false;
  bool isConfirmed = false;

  AgentCrt(
      {required this.name,
      required this.lastName,
      required this.birthDate,
      required this.phone,
      required this.email,
      required this.isAdmin,
      required this.isConfirmed});
  AgentCrt.empty();

  static AgentCrt fromMap(Map<String, dynamic> map, String documentId) {
    return AgentCrt(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      birthDate: map['birthDate'].toString(),
      phone: map['phone'] as String,
      email: map['email'] as String,
      isAdmin: map['isAdmin'] as bool,
      isConfirmed: map['isConfirmed'] as bool,
    );
  }
}
