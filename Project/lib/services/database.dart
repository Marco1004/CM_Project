import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseManager {
  List info_rooms = [];
  String? selected_room;

  QuerySnapshot? info_devices;
  String? selected_device;

  Future<List> getRooms() async {
    try {
      var x = await FirebaseFirestore.instance
          .collection('home')
          .doc('rooms')
          .get();

      return x['rooms'];
    } catch (e) {
      return [];
    }
  }

  Future<List?> getDevices() async {
    try {
      var x = await FirebaseFirestore.instance
          .collection('home')
          .doc('devices')
          .collection('devices')
          .where('room', isEqualTo: selected_room)
          .get();
      return x[];
    } catch (e) {
      return null;
    }
  }
}
