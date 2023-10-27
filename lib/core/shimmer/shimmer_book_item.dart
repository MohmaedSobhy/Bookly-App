import 'package:books_app/core/widgets/skelton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookItem extends StatelessWidget {
  const ShimmerBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skelton(
              width: MediaQuery.sizeOf(context).width * 0.25,
              height: MediaQuery.sizeOf(context).width * 0.25,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skelton(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                    width: MediaQuery.sizeOf(context).width * 0.2,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Skelton(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Skelton(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                    width: MediaQuery.sizeOf(context).width * 0.65,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
