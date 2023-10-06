import 'dart:io';
import 'package:books_app/feature/user%20profile/widgets/circle_file_image.dart';
import 'package:books_app/feature/user%20profile/widgets/pick_image_button.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  final bool condition;
  final File? imageFile;
  final VoidCallback onTap;
  const ImageProfile({
    super.key,
    required this.condition,
    required this.imageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Visibility(
          visible: condition,
          child: const CircleAvatar(
            radius: 80,
            child: Icon(
              Icons.person,
              size: 80,
            ),
          ),
        ),
        if (condition == false)
          CircleFileImage(
            radius: 80,
            imageProfile: imageFile!,
          ),
        ImagePickerView(
          onTap: onTap,
        )
      ],
    );
  }
}
