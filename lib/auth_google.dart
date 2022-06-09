import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationGoogle {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<bool> signIn() async {
    try {
      await _googleSignIn.signIn();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "unknown error");
      return false;
    }
  }
}
