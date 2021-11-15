import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // anon sign in
  Future signInAnon() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // email/pass sign in

  // email/pass register

  // sign out
}
