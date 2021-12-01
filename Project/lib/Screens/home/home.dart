import 'package:deliverable1/Screens/home/cam_tab.dart';
import 'package:deliverable1/Screens/home/home_tab.dart';
import 'package:deliverable1/Screens/home/map_tab.dart';
import 'package:deliverable1/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
