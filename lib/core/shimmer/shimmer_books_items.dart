import 'package:flutter/material.dart';

class ShimmerBooksItmes extends StatelessWidget {
  const ShimmerBooksItmes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, __) {
        return const ShimmerBooksItmes();
      },
      itemCount: 10,
    );
  }
}
