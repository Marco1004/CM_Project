import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseManager {
  List info_rooms = [];
  String? selected_room;

  List info_devices = [];
  String? selected_device;
  var device;

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

  Future<List> getDevices(String? room) async {
    try {
      var x = await FirebaseFirestore.instance
          .collection('home')
          .doc('devices')
          .collection('devices')
          .where('room', isEqualTo: room)
          .get();
      return x.docs;
    } catch (e) {
      return [];
    }
  }

/*
  Future<CollectionReference> getDeviceRef() async{
    var x= await FirebaseFirestore.instance
      .collection('home')
      .doc('devices')
      .collection(selected_device);
    return
  }
*/
}
