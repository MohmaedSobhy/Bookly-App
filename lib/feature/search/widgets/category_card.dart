import 'package:flutter/material.dart';

class CategoryFilterationCard extends StatelessWidget {
  final String text;
  final Color? backGround;
  final VoidCallback onTap;
  const CategoryFilterationCard(
      {super.key, this.backGround, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:
              (backGround == null) ? Colors.grey.withOpacity(0.1) : backGround,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: (backGround == null) ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
