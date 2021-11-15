//import 'dart:html';

//import 'package:deliverable1/authentication/auth.dart';
import 'package:deliverable1/authentication/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';
//import 'package:flutter_blue/flutter_blue.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return const SignIn();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange.shade100,
            bottom: const TabBar(labelColor: Colors.black, tabs: [
              Tab(text: "Rooms"),
              Tab(text: "Devices"),
            ]),
          ),
          drawer: Drawer(
              child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("User"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
            ],
          )),
          body: const TabBarView(children: [
            RoomsTab(),
            DevicesTab(),
          ]),
        ),
      ),
    );
  }
}

class RoomsTab extends StatelessWidget {
  const RoomsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: const [
        RoomButton("Living Room", Icon(Icons.tv, color: Colors.white)),
        RoomButton("Bedroom", Icon(Icons.bed, color: Colors.white))
      ],
    );
  }
}

class DevicesTab extends StatelessWidget {
  const DevicesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: const [
        DeviceButton("Light", Icon(Icons.lightbulb, color: Colors.white)),
        DeviceButton("Thermometer", Icon(Icons.thermostat, color: Colors.white))
      ],
    );
  }
}

/*class RoomView extends StatelessWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
  }
}
*/

/*
class CustomButton extends StatelessWidget {
  final String button;
  final Icon icon;
  const CustomButton(this.button, this.icon);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: null,
              icon: icon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0))),
                fixedSize: MaterialStateProperty.all(const Size(200, 200)),
              ),
              label: Text(
                button,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            )
          ]),
    );
  }
}
*/