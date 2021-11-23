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
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
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
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: info_room.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              context.read<DatabaseManager>().selected_room = info_room[index];
              //     Navigator.push(
              // context, MaterialPageRoute(builder: (context) => Workout()));
            },
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  getRoomsIcons(info_room[index]),
                  color: Colors.black,
                ),
                Text(info_room[index]),
              ],
            )),
          );
        },
      ),
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
        DeviceButton(
            "Thermometer", Icon(Icons.thermostat, color: Colors.white)),
      ],
    );
  }
}
