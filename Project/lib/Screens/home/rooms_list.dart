import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class rooms_list {
  rooms_list();
  @override
  List<String> _rooms = [];
  void getRooms() {
    FirebaseFirestore.instance
        .collection('home')
        .doc('rooms')
        .collection('rooms')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _rooms.add(doc["type"].toString());
        //print(doc["type"]);
      });
    });
  }
}
