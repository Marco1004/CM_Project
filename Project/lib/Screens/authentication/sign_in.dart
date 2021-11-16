import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade100,
        appBar: AppBar(
            backgroundColor: Colors.orange.shade100,
            elevation: 0.0,
            title: const Text('Sign In')),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: const ElevatedButton(
            child: Text('Sign In Anonymously'),
            onPressed: null,
          ),
        ));
  }
}
