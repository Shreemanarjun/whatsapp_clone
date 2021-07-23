import 'package:flutter/material.dart';

import 'package:camera_camera/camera_camera.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraCamera(
          resolutionPreset: ResolutionPreset.ultraHigh,
          onFile: (file) {}),
    );
  }
}
