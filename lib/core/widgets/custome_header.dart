import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String title;
  final String decription;
  const HeaderText({
    super.key,
    required this.decription,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        Text(
          decription,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
