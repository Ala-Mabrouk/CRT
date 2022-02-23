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
    String usermail,
    String username,
    String userlastname,
    String userBirthDate,
    String userphone,
    bool isAd,
    bool isCon,
  ) {
    this.name = username;
    this.lastName = userlastname;
    this.birthDate = userBirthDate;
    this.phone = userphone;
    this.email = usermail;
    this.isAdmin = isAd;
    this.isConfirmed = isCon;
  }

  AgentCrt.empty();

  AgentCrt.fromMap(Map<String, dynamic> map) {
    name = map['name'] ?? '';
    lastName = map['lastName'] ?? '';
    birthDate = map['birthDate'] ?? '';
    phone = map['phone'] ?? '';
    email = map['email'] ?? '';
    isAdmin = map['isAdmin'] ?? false;
    isConfirmed = map['isConfirmed'] ?? false;
  }
}
