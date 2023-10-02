import 'package:flutter/material.dart';

class SizedBoxHight extends StatelessWidget {
  const SizedBoxHight({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.02,
    );
  }
}
