import 'package:deliverable1/services/database.dart';
import 'package:flutter/material.dart';
import '../custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

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

/*
class RoomsTab extends StatelessWidget {
  const RoomsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: [
        RoomButton("Living Room", Icon(Icons.tv, color: Colors.white)),
        RoomButton("Bedroom", Icon(Icons.bed, color: Colors.white)),
      ],
    );
  }
}
*/

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
        DeviceButton(
            "Thermometer", Icon(Icons.thermostat, color: Colors.white)),
      ],
    );
  }
}

class RoomsTab extends StatelessWidget {
  const RoomsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: getDoc('rooms').doc,
      initialData: null,
      child: GridView.count(
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: const [
          RoomButton("Living Room", Icon(Icons.tv, color: Colors.white)),
          RoomButton("Bedroom", Icon(Icons.bed, color: Colors.white))
        ],
      ),
    );
  }
}
