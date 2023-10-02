import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/routes/route_name.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../controller/setting_.state.dart';
import '../controller/setting_cubit.dart';
import '../view/bottom_sheet_setting.dart';
import '../widgets/setting_list_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingCubitState>(
      listener: (context, state) {
        if (state is LogoutState) {
          Get.offAllNamed(RoutesName.spalsh);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              AppString.setting,
              style: TextStyle(
                color: AppColor.darkBlue,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.02,
              vertical: MediaQuery.sizeOf(context).height * 0.02,
            ),
            child: ListView(
              children: [
                ListTitleSettingWidget(
                  txtTitle: AppString.updatePassword,
                  leadingIcon: Icons.lock,
                  trailingWidget: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Get.toNamed(RoutesName.updatePassword);
                  },
                ),
                ListTitleSettingWidget(
                  txtTitle: AppString.paymentHistory,
                  leadingIcon: Icons.payment,
                  onTap: () {},
                  trailingWidget: const Icon(Icons.arrow_forward),
                ),
                ListTitleSettingWidget(
                  txtTitle: AppString.logout,
                  leadingIcon: Icons.logout,
                  onTap: () {
                    showBottomSheet(
                      context: context,
                      builder: (context) {
                        return const ButtonSheetSetting();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
