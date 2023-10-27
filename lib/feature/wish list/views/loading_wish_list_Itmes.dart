import 'package:books_app/core/shimmer/shimmer_book_item.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingWishListItems extends StatelessWidget {
  const ShimmerLoadingWishListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (_, __) {
        return const ShimmerBookItem();
      },
    );
  }
}
