import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseManager {
  List info_rooms = [];
  String? selected_room;
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
}
