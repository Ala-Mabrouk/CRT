import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  //FirebaseAuth instance.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //users collection reference
  final CollectionReference usersColl =
      FirebaseFirestore.instance.collection("CRT_Agents");
  //timer
  Timer _authTimer = Timer(Duration(hours: 1), () {});
  //auth user stream
  Stream<AgentCrt?> get user {
    return _auth
        .authStateChanges()
        .map((event) => _agentCrtFromFirebase(event));
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: mail, password: pass);

      //saving user info
      if (result.user != null) {
        prefs.setString('userEmail', result.user!.email.toString());
        prefs.setString('userId', result.user!.uid);
        //creation of tokens and expiration date
        final DateTime expireDate = DateTime.now().add(Duration(hours: 24));
        prefs.setString('expireDate', expireDate.toString());
        setAuthTimeout(24);
      }

      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

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

  //auto authentication ned to be called in the main

  Future<bool> autoAthenticate() async {
    print('autoAuthenticate()');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String UserId = prefs.getString('userId').toString();
    print(UserId);
    if (UserId != Null) {
      final expiryTimeString = prefs.getString('expireDate').toString();

      final parsedExpiryTime = DateTime.parse(expiryTimeString);
      if (parsedExpiryTime.isBefore(DateTime.now())) {
        return false;
      }
      return true;
    }
    return false;
  }

  // set auth timeout which will logout
  void setAuthTimeout(int time) {
    _authTimer = Timer(Duration(hours: time), () {
      logout();
      // _userSubject.add(false);
    });
  }

  void logout() async {
    print('Logout');

    _auth.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    // or do it individually
    // prefs.remove('token');
    // prefs.remove('userEmail');
    // prefs.remove('userId');
  }
}
