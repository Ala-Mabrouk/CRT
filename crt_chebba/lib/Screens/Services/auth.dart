import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  //FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //users collection reference
  final CollectionReference usersColl =
      FirebaseFirestore.instance.collection("CRT_Agents");

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
