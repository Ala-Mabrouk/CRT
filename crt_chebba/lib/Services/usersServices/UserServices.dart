import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';

class UserServices {
  final CollectionReference usersColl =
      FirebaseFirestore.instance.collection("CRT_Agents");

  Future<AgentCrt> getUserInfo(String id) async {
    return await usersColl.doc(id).get().then(
        (value) => AgentCrt.fromMap(value.data() as Map<String, dynamic>));
  }

  Future addUsers(AgentCrt _AgentCrt) async {
    return await usersColl.doc(_AgentCrt.agentId).set({
      'agentId': _AgentCrt.agentId,
      'name': _AgentCrt.name,
      'lastName': _AgentCrt.lastName,
      'birthDate': _AgentCrt.birthDate,
      'phone': _AgentCrt.phone,
      'email': _AgentCrt.email,
      'isAdmin': _AgentCrt.isAdmin,
      'isConfirmed': _AgentCrt.isConfirmed
    });
  }
}
