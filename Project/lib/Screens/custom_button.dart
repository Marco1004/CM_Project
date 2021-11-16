import 'package:flutter/material.dart';

class DeviceButton extends StatelessWidget {
  final String button;
  final Icon icon;
  const DeviceButton(this.button, this.icon);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: null,
              icon: icon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0))),
                fixedSize: MaterialStateProperty.all(const Size(150, 150)),
              ),
              label: Text(
                button,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            )
          ]),
    );
  }
}

class RoomButton extends StatelessWidget {
  final String button;
  final Icon icon;
  const RoomButton(this.button, this.icon);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: null,
              icon: icon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0))),
                fixedSize: MaterialStateProperty.all(const Size(150, 150)),
              ),
              label: Text(
                button,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            )
          ]),
    );
  }
}
