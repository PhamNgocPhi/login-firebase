import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String pass}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      return 'Signed in';
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String pass}) async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      return 'Signed up';
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
