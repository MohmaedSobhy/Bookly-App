import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/feature/update_password/view/update_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';

import '../../../core/widgets/no_internet_conection.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.darkBlue,
          ),
        ),
        title: const Text(
          AppString.updatePassword,
          style: TextStyle(
            color: AppColor.darkBlue,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          return (connectivity != ConnectivityResult.none)
              ? const UpdatePasswordBody()
              : const NoInternetConnectionWidget();
        },
        child: const UpdatePasswordBody(),
      ),
    );
  }
}
