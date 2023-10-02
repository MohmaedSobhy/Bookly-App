import 'package:flutter/material.dart';

import '../../../core/widgets/sized_box_high.dart';
import '../model/boarding_model.dart';

class BoardingView extends StatelessWidget {
  final BoardingModel boardingModel;
  final double height;
  const BoardingView(
      {super.key, required this.boardingModel, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            boardingModel.image,
            height: height,
          ),
          const SizedBoxHight(),
          Text(
            boardingModel.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBoxHight(),
          Text(
            boardingModel.discription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
