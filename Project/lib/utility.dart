import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

IconData? getIcons(String name) {
  Map<String, IconData> x = {
    //rooms
    'Living room': Icons.tv,
    'Bedroom': Icons.bed_sharp,
    'Kitchen': Icons.kitchen,
    'Bathroom': Icons.shower,

    //devices
    'Light': Icons.lightbulb,
    'Thermometer': Icons.thermostat,
    'AC': Icons.ac_unit,
    'TV': Icons.tv,
    'Sound': Icons.speaker,
  };

  return x[name];
}
