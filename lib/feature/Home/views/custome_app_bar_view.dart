import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeAppBarView extends StatelessWidget {
  const CustomeAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        width: MediaQuery.sizeOf(context).width * 0.10,
        image: const AssetImage("images/menu.png"),
      ),
      title: const Text(
        "Mohamed Sobhy",
        style: TextStyle(
          color: AppColor.darkBlue,
          fontWeight: FontWeight.w800,
        ),
      ),
      subtitle: const Text(
        "What are you reading today",
        style: TextStyle(
          color: AppColor.darkBlue,
          fontWeight: FontWeight.w800,
        ),
      ),
      trailing: InkWell(
        onTap: () {
          Get.toNamed(RoutesName.userProfile);
        },
        child: const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("images/acpc.jfif"),
        ),
      ),
    );
  }
}
