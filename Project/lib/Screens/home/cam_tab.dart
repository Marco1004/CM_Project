import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamTab extends StatefulWidget {
  const CamTab({Key? key}) : super(key: key);

  @override
  _CamTabState createState() => _CamTabState();
}

class _CamTabState extends State<CamTab> {
  XFile? _image;
  Future<dynamic> getImage() async {
    try {
      final XFile? photo =
          await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        _image = photo;
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
