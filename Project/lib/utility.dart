import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

IconData? getRoomsIcons(String name) {
  Map<String, IconData> x = {
    'living room': Icons.tv,
    'bedroom': Icons.bed_sharp
  };

  return x[name];
}
