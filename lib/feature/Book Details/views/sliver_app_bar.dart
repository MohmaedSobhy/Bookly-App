import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_color.dart';

class CustomeSliverAppBar extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback addtoFavourite;
  final Icon favouriteIcon;

  const CustomeSliverAppBar({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.addtoFavourite,
    required this.favouriteIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      stretch: true,
      backgroundColor: AppColor.darkBlue,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColor.darkBlue),
        ),
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: AppColor.darkBlue.withOpacity(0.4),
        radius: 25,
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: AppColor.darkBlue.withOpacity(0.4),
          radius: 25,
          child: IconButton(
            onPressed: addtoFavourite,
            icon: favouriteIcon,
          ),
        ),
      ],
    );
  }
}
