import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  //FirebaseAuth instance.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //users collection reference
  final CollectionReference usersColl =
      FirebaseFirestore.instance.collection("CRT_Agents");

//auth user stream
  Stream<AgentCrt?> get user {
    return _auth
        .authStateChanges()
        .map((event) => _agentCrtFromFirebase(event));
  }

//sign anoum for test
  Future signInanoum() async {
    try {
      UserCredential result = await _auth.signInAnonymously();

      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//convert firestoreUser to AgentCRt

  AgentCrt? _agentCrtFromFirebase(User? fireUser) {
    //get the agetId from firebase auth
    String uid = fireUser!.uid;
    //get the agent from the firestore using the uid
    AgentCrt agCrt = AgentCrt.empty();
    FirebaseFirestore.instance
        .collection('CRT_Agents')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return agCrt = AgentCrt.fromMap(data, uid);
      }
    });
  }

//signIn with mail
  Future signInEmailPassword(String mail, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: mail, password: pass);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register a new Agent to firebase
  Future registerNewAgent(AgentCrt ag) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: ag.email, password: ag.password);

      // we need to bring the other registration
      //that saves in firestore to save the full AgentCRT
      if (result != null) {
        ag.agentId = result.user!.uid;
        addUsers(ag);

        return result.user;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //save new agent to database
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
