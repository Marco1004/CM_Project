import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverable1/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:deliverable1/utility.dart';

// row buttons with information dellow depending on device button
class Room extends StatefulWidget {
  const Room({Key? key}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  late Future<QuerySnapshot?> data;
  List info_device = [];
  @override
  void initState() {
    data = DatabaseManager().getDevices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              context.read<DatabaseManager>().info_devices =
                  snapshot.data as QuerySnapshot?;
              return RoomScreen();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }
}

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  QuerySnapshot? info_device;
  String? room;
  DocumentSnapshot? device;

  @override
  void initState() {
    room = context.read<DatabaseManager>().selected_room;
    info_device = context.read<DatabaseManager>().info_devices;
    super.initState();
  }

  @override
  /*
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50.0,
              childAspectRatio: 1.0,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 10.0),
          //itemCount: info_device.,
          itemBuilder: (context, index) {
            return ElevatedButton(
                onPressed: () {
                  context.read<DatabaseManager>().selected_device =
                      info_device[index];
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
                      getIcons(info_device[index]),
                      color: Colors.white,
                      size: 30.0,
                    ),
                    Text(
                      info_device[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    )
                  ],
                )));
          }),
    );
  }*/
}
