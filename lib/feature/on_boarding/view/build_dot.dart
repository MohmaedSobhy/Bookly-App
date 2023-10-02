import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class BuildDotBoardingView extends StatelessWidget {
  final int currentIndex;
  final int index;
  const BuildDotBoardingView(
      {super.key, required this.currentIndex, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (currentIndex == index) ? AppColor.mainColor : Colors.grey,
      ),
    );
  }
}
