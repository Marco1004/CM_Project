import 'package:flutter/material.dart';
import 'package:deliverable1/services/database.dart';
import 'package:provider/src/provider.dart';

class device_var extends StatefulWidget {
  const device_var({Key? key}) : super(key: key);

  @override
  _device_varState createState() => _device_varState();
}

class _device_varState extends State<device_var> {
  var device;
  @override
  void initState() {
    print("Here!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    device = context.read<DatabaseManager>().selected_device;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (device == null) {
      return Text("Select a device");
    }
    if (device == "Light") {
      return Container(
          child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text("Intensity"),
                RangeSlider(
                  values: RangeValues(0, 10),
                  onChanged: null,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("Color"),
                RangeSlider(
                  values: RangeValues(0, 10),
                  onChanged: null,
                ),
              ],
            ),
          ),
        ],
      ));
    }
    if (device == "Thermometer") {
      return Container();
    }
    if (device == "AC") {
      return Container(
          child: Column(
        children: [
          Text("Humidity: ${device.data()['humidity']}"),
          Text("Temperature: ${device.data()['temperature']}"),
        ],
      ));
    }
    if (device == "Sound") {
      return Container(
          child: Column(
        children: [
          Text("Intensity"),
          RangeSlider(
            values: RangeValues(0, 10),
            onChanged: null,
          ),
        ],
      ));
    }
    return Container();
  }
}

/*
Future<void> volume() {
  var device = context.read<DatabaseManager>().device;
  DocumentReference x = FirebaseFirestore.instance
      .collection('home')
      .doc('devices')
      .collection('devices')
      .doc(device);
}
*/
