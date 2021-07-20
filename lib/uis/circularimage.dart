import 'package:flutter/material.dart';

//Circular Avtar Implementation
class CircularImage extends StatelessWidget {
  final String imagePath;

  const CircularImage(
    this.imagePath, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imagePath))),
    );
  }
}
