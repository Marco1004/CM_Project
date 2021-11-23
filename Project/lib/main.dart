//import 'dart:html';

import 'package:deliverable1/services/auth.dart';
import 'package:deliverable1/services/database.dart';
import 'package:deliverable1/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:flutter_blue/flutter_blue.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
     
      Provider<DatabaseManager>(
        create: (_) => DatabaseManager(),
      ),
       StreamProvider<User?>.value(
      //create: (context) => context.read<AuthService>().user,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    )
    ],
    child: MaterialApp(home: Wrapper()),);

   
    //
  }
}
