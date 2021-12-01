import 'package:deliverable1/Screens/room.dart';
import 'package:deliverable1/services/database.dart';
import 'package:deliverable1/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Room()));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.blueGrey.shade500),
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
  }
}
