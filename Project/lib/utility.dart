import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

IconData? getIcons(String name) {
  Map<String, IconData> x = {
    //rooms
    'living room': Icons.tv,
    'bedroom': Icons.bed_sharp,
    'kitchen': Icons.kitchen,
    'bathroom': Icons.shower,

    //devices
    'light': Icons.lightbulb,
    'thermometer': Icons.thermostat,
    'ac': Icons.ac_unit,
    'tv': Icons.tv,
  };

  return x[name];
}
