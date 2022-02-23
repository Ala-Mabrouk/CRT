import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:crt_chebba/models/Family.dart';

class AgentManagement {
  final CollectionReference AgentsCollection =
      FirebaseFirestore.instance.collection("CRT_Agents");

  Future<List<AgentCrt>> fetchAgentsAsStream() async {
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
}
