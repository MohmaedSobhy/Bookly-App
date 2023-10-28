import 'package:books_app/core/shimmer/shimmer_book_item.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingView extends StatelessWidget {
  const ShimmerLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, __) {
        return const ShimmerBookItem();
      },
    );
  }
}
