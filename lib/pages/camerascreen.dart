import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraCamera(
          resolutionPreset: ResolutionPreset.ultraHigh,
          onFile: (file) => print(file)),
    );
  }
}
