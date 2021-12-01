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
  List info_location = [];
  late Future<GeoPoint?> locat;

  @override
  final selected_home = 'home';
  void initState() {
    data = DatabaseManager().getLocation();
    super.initState();
  }

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
      //markers: _updateMarkers(),
    ));
  }
}

//void _updateMarker()