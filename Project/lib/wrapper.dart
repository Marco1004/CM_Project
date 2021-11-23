import 'package:deliverable1/Screens/authentication/authentication.dart';
import 'package:deliverable1/Screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curUser = Provider.of<User?>(context);

    if (curUser == null) {
      return Authentication();
    } else {
      return HomeScreen();
    }
  }
}
