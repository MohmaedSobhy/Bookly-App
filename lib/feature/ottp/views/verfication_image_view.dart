import 'package:flutter/material.dart';

class VerficationImageView extends StatelessWidget {
  const VerficationImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/resendcode.png"),
        ),
      ),
    );
  }
}
