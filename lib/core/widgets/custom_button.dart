import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? width;
  final Color? backGroundColor;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width,
      decoration: BoxDecoration(
        color: (backGroundColor == null)
            ? Theme.of(context).primaryColor
            : backGroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
