import 'package:books_app/feature/contact_us/view/contact_us_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/no_internet_conection.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
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
          AppString.contactUs,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.darkBlue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0.0,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          return (connectivity != ConnectivityResult.none)
              ? const ContactUsBody()
              : const NoInternetConnectionWidget();
        },
        child: const ContactUsBody(),
      ),
    );
  }
}
