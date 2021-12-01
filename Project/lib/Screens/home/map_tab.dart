import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverable1/Screens/home/cam_tab.dart';
import 'package:deliverable1/services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/src/provider.dart';

class MapTab extends StatefulWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  _MapTabState createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  late Future<List?> data;
  List info = [];
  List<Marker> markers = [];

  late Future<GeoPoint?> locat;

  int aux = 1;
  @override
  final selected_home = 'home';
  void initState() {
    data = DatabaseManager().getLocation();
    super.initState();
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(40.639, -8.65),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          info = snapshot.data as List;
          for (var element in info) {
            GeoPoint x = element.data()['location'];
            markers.add(Marker(
              markerId: MarkerId(aux.toString()),
              position: LatLng(x.latitude, x.longitude),
            ));
          }

          return GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              markers: markers.toSet());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

//void _updateMarker()