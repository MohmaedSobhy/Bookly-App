import 'package:flutter/material.dart';
import '../../../core/theme/app_color.dart';

class TextHeader extends StatelessWidget {
  final String title;
  const TextHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.sizeOf(context).width * 0.01,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColor.darkBlue,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
