import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}
