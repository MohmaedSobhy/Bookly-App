import 'package:flutter/material.dart';

class NoBooksViews extends StatelessWidget {
  const NoBooksViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        width: MediaQuery.sizeOf(context).width * 0.5,
        image: const AssetImage("images/love.png"),
      ),
    );
  }
}
