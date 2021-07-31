class AgentCrt {
  final String agentId;
  String name = '';
  String lastName = '';
  DateTime birthDate = new DateTime(2021);
  String phone = '';
  final String email;
  String password = '';
  bool isAdmin = false;
  bool isConfirmed = false;

  AgentCrt({required this.agentId, required this.email});
}
