import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // anon sign in
  Future signInAnon() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print(userCredential.user!.uid);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // email/pass sign in
  Future EmailSignIn(String userEmail, String userPass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    // email confirmation
    /*
    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
    */
  }

  // email/pass register
  Future EmailReg(String userEmail, String userPass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userEmail, password: userPass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // sign out
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  User? getUser() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return currentUser;
    } else {
      return null;
    }
  }

  Stream<User?> get user {
    return _auth.authStateChanges();
  }
}
