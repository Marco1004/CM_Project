import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
            bottom: TabBar(labelColor: Colors.black, tabs: [
              Tab(text: "Rooms"),
              Tab(text: "Devices"),
            ]),
          ),
          drawer: Drawer(
              child: ListView(
            children: [
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
          body: TabBarView(children: [
            RoomsScreen(),
            DevicesScreen(),
          ]),
        ),
      ),
    );
  }
}

class RoomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: [Room('Living Room'), Room('Kitchen'), Room('Bathroom')],
    ));
  }
}

class DevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: [Room('Lights'), Room('Heating'), Room('Electrodomestics')],
    ));
  }
}

class Room extends StatelessWidget {
  @override
  final String division;
  const Room(this.division);

  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          division,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        Icon(
          Icons.house,
          color: Colors.white,
        ),
      ]),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.black,
      ),
      margin: EdgeInsets.all(45.0),
    );
  }
}

class Device extends StatelessWidget {
  @override
  final String utensil;
  const Device(this.utensil);

  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          utensil,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        Icon(
          Icons.house,
          color: Colors.white,
        ),
      ]),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.black,
      ),
      margin: EdgeInsets.all(45.0),
    );
  }
}
