import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:crt_chebba/models/Family.dart';

class AgentManagement {
  final CollectionReference AgentsCollection =
      FirebaseFirestore.instance.collection("CRT_Agents");

  Future<List<AgentCrt>> fetchAgentsAsFuture() async {
    try {
      var myList = await AgentsCollection.get().then((value) => value.docs
          .map((doc) => AgentCrt.fromMap(doc.data() as Map<String, dynamic>))
          .toList());

      return myList;
    } catch (e) {
      print("erreur ocured");
      print(e.toString());
      return List.empty();
    }
  }

  Stream<List<AgentCrt>>? fetchAgentsAsStream() {
    List<AgentCrt?> AgentsList;
    try {
      return AgentsCollection.snapshots().map((alldocs) {
        return alldocs.docs
            .map((e) => AgentCrt.fromMap(e.data() as Map<String, dynamic>))
            .toList();
      });
    } catch (e) {
      return null;
    }
  }

//active an agent

  Future activateAgent(String id) async {
    await AgentsCollection.doc(id).update({"isConfirmed": true}).then(
        (value) => print("done Activating"));
  }

  Future blockAgent(String id) async {
    await AgentsCollection.doc(id)
        .update({"isConfirmed": false}).then((value) => print("done blocking"));
  }
}
