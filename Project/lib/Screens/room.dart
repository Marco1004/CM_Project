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
  late Future<List?> data;
  List info_device = [];
  String? room;
  late var device;

  @override
  void initState() {
    room = DatabaseManager().selected_room;
    data = DatabaseManager().getDevices(room);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        //: Text(room),
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        color: Colors.blueGrey.shade900,
        child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                context.read<DatabaseManager>().info_devices =
                    snapshot.data as List;
                return RoomScreen();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    ));
  }
}

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  List info_device = [];
  String? room;
  var device;

  @override
  void initState() {
    room = context.read<DatabaseManager>().selected_room;
    info_device = context.read<DatabaseManager>().info_devices;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(30.0),
              itemCount: info_device.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<DatabaseManager>().selected_device =
                              info_device[index].data()['type'];
                          device = info_device[index];
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.blueGrey.shade400),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          fixedSize: MaterialStateProperty.all(
                              const Size(100.0, 50.0)),
                          //alignment: Alignment.center,
                        ),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              getIcons(info_device[index].data()['type']),
                              color: Colors.white,
                              size: 30.0,
                            ),
                            Text(
                              info_device[index].data()['type'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            )
                          ],
                        ))),
                  ),
                );
              }),
        ),
        // get device information
      ],
    );
  }
}
