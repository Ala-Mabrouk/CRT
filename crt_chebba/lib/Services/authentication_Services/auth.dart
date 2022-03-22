import 'package:crt_chebba/Services/usersServices/UserServices.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Timer _authTimer = Timer(Duration(hours: 1), () {});
  AgentCrt agentCrt = AgentCrt.empty();
//  Future<AgentCrt?> get agentCRT async => await autoAthenticate();

  // set auth timeout which will logout
  void setAuthTimeout(int time) {
    _authTimer = Timer(Duration(hours: time), () {
      logout();
    });
  }

  //signIn with mail
  Future<AgentCrt?> signInEmailPassword(String mail, String pass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: mail, password: pass);

      if (result.user != null) {
        AgentCrt ag = await UserServices().getUserInfo(result.user!.uid);
        if (ag.isConfirmed) {
          //saving user info
          prefs.setString('userEmail', result.user!.email.toString());
          prefs.setString('userFullName', ag.name + ' ' + ag.lastName);
          prefs.setString('userId', result.user!.uid);
          prefs.setBool('isAdmin', ag.isAdmin);
          //creation of tokens and expiration date
          final DateTime expireDate = DateTime.now().add(Duration(hours: 12));
          prefs.setString('expireDate', expireDate.toString());
          setAuthTimeout(12);
        }
        return ag;
      }

      return null;
    } on FirebaseAuthException catch (e) {
      rethrow;

      // return null;
    }
  }
//reset password

  Future resetPassword(String mail) async {
    await _auth.sendPasswordResetEmail(email: mail);
  }

  //register a new Agent to firebase
  Future<AgentCrt> registerNewAgent(AgentCrt ag) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: ag.email, password: ag.password);

      // we need to bring the other registration
      //that saves in firestore to save the full AgentCRT
      if (result != null) {
        ag.agentId = result.user!.uid;
        UserServices().addUsers(ag);
        AgentCrt _ag = await UserServices().getUserInfo(ag.agentId);
//
        prefs.setString('userEmail', result.user!.email.toString());
        prefs.setString('userFullName', ag.name + ' ' + ag.lastName);
        prefs.setString('userId', result.user!.uid);
        prefs.setBool('isAdmin', ag.isAdmin);
        //creation of tokens and expiration date
        final DateTime expireDate = DateTime.now().add(Duration(hours: 12));
        prefs.setString('expireDate', expireDate.toString());
        setAuthTimeout(12);
//
        return _ag;
      }
      return AgentCrt.empty();
      ;
    } catch (e) {
      print(e);
      return AgentCrt.empty();
    }
  }

//update info
  Future updateUSerInfo(AgentCrt _user, bool pass) async {
    try {
      if (pass) {
        User? u = _auth.currentUser;
        await u!.updatePassword(_user.password);
      }
      UserServices().updateUser(_user);
      return _user;
    } catch (e) {
      print(e);
      return null;
    }
  }
  //auto authentication need to be called in the main

  Future<AgentCrt?> autoAthenticate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String UserId = await prefs.getString('userId').toString();
    if (UserId.length >= 8) {
      final expiryTimeString = prefs.getString('expireDate').toString();
      //changing "expiryTimeString" to date type
      final parsedExpiryTime = DateTime.parse(expiryTimeString);
      if (parsedExpiryTime.isAfter(DateTime.now())) {
        return UserServices().getUserInfo(UserId);
      }
    }
    return agentCrt;
  }

  Future<bool> isAdmin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _isAdmin = await prefs.getBool('isAdmin') ?? false;
    return _isAdmin;
  }

  Future<bool> logout() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      await _auth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }

    // or do it individually
    // prefs.remove('token');
    // prefs.remove('userEmail');
    // prefs.remove('userId');
  }
}
