import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CamTab extends StatefulWidget {
  const CamTab({Key? key}) : super(key: key);

  @override
  _CamTabState createState() => _CamTabState();
}

class _CamTabState extends State<CamTab> {
  File? image;
  Future<dynamic> getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final tempImage = File(image.path);
      setState(() {
        this.image = tempImage;
      });
    } catch (e) {
      print('Failed operation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FloatingActionButton(
      onPressed: () {
        getImage();
      },
      heroTag: 'Image',
      tooltip: 'Take a photo',
      child: const Icon(Icons.camera_alt),
    ));
  }
}
