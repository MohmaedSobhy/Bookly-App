import 'package:flutter/material.dart';

class ImagePickerView extends StatelessWidget {
  final VoidCallback onTap;
  const ImagePickerView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey.withOpacity(0.7),
        child: IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.camera_alt,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
