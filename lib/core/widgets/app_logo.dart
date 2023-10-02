import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/app_icon.png"),
        ),
      ),
    );
  }
}
