import 'package:books_app/core/widgets/sized_box_high.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeView extends StatelessWidget {
  const ShimmerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: const [
            ShimmerImageSlider(),
            SizedBoxHight(),
            ShimmerLoadingCategory(),
            SizedBoxHight(),
            ShimmerBookOffers(),
            SizedBoxHight(),
            ShimmerBookOffers(),
          ],
        ),
      ),
    );
  }
}

class ShimmerImageSlider extends StatelessWidget {
  const ShimmerImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.2,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}

class ShimmerLoadingCategory extends StatelessWidget {
  const ShimmerLoadingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, __) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShimmerBookOffers extends StatelessWidget {
  const ShimmerBookOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
