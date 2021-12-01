import 'package:deliverable1/Screens/room.dart';
import 'package:deliverable1/services/database.dart';
import 'package:deliverable1/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> data;
  List info = [];
  int _selectedIndex = 0;
  @override
  void initState() {
    data = DatabaseManager().getRooms();
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    MapTab(),
    HomeTab(),
    CamTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SMART HOME'),
          backgroundColor: Colors.black,
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
        body: Container(
          color: Colors.blueGrey.shade900,
          child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                context.read<DatabaseManager>().info_rooms =
                    snapshot.data as List;
                return Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ); //HomeTab();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          fixedColor: Colors.white,
          backgroundColor: Colors.blueGrey.shade800,
        ),
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _RoomsTabState();
}

class _RoomsTabState extends State<HomeTab> {
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

class CamTab extends StatefulWidget {
  const CamTab({Key? key}) : super(key: key);

  @override
  _CamTabState createState() => _CamTabState();
}

class _CamTabState extends State<CamTab> {
  Future getImage() async {
    try {
      final XFile? photo =
          await ImagePicker().pickImage(source: ImageSource.camera);
    } on PlatformException catch (e) {
      print('Failed operation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MapTab extends StatefulWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  _MapTabState createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GoogleMap(
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      initialCameraPosition: _initialCameraPosition,
    ));
  }
}
