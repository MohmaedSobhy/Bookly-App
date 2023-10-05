import 'dart:io';

import 'package:flutter/material.dart';

class CircleFileImage extends StatelessWidget {
  final File imageProfile;
  final double radius;
  const CircleFileImage(
      {super.key, required this.imageProfile, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: ClipOval(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(imageProfile),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
