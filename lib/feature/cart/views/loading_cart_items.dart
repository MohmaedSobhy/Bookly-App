import 'package:books_app/core/shimmer/shimmer_book_item.dart';
import 'package:flutter/material.dart';

class LoadingCartItemsView extends StatelessWidget {
  const LoadingCartItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, __) {
        return const ShimmerBookItem();
      },
    );
  }
}
