import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth;
  Authentication(this._firebaseAuth);
  Future<bool> SignIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "unknown error");
      return false;
    }
  }

  Future<bool> SignUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "unknown error");
      return false;
    }
  }
}
