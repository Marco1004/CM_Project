import 'package:deliverable1/services/database.dart';
import 'package:deliverable1/utility.dart';
import 'package:flutter/material.dart';
import '../custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> data;
  List info = [];
  @override
  void initState() {
    data = DatabaseManager().getRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SMART HOME'),
          backgroundColor: Colors.orange.shade100,
          elevation: 0,
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
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              context.read<DatabaseManager>().info_rooms =
                  snapshot.data as List;
              return RoomsTab();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class RoomsTab extends StatefulWidget {
  const RoomsTab({Key? key}) : super(key: key);

  @override
  State<RoomsTab> createState() => _RoomsTabState();
}

class _RoomsTabState extends State<RoomsTab> {
  List info_room = [];

  @override
  void initState() {
    info_room = context.read<DatabaseManager>().info_rooms;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10),
        itemCount: info_room.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              context.read<DatabaseManager>().selected_room = info_room[index];
              //     Navigator.push(
              // context, MaterialPageRoute(builder: (context) => Workout()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
              //fixedSize: MaterialStateProperty.all(const Size(150, 150)),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  getIcons(info_room[index]),
                  color: Colors.white,
                  size: 30.0,
                ),
                Text(
                  info_room[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                )
              ],
            )),
          );
        },
      ),
    );
    //);
  }
}
