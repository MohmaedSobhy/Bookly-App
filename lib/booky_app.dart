import 'package:books_app/feature/Home/controller/home_cubit.dart';
import 'package:books_app/feature/contact%20us/screen/contact_screen.dart';
import 'package:books_app/feature/setting/controller/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'core/routes/route_setting.dart';
import 'core/theme/app_color.dart';

class BookyApp extends StatelessWidget {
  const BookyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingCubit()),
        BlocProvider(create: (_) => HomeCubit()..laodData()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouting.genertateRoute,
        //  home: const ContactUsScreen(),
        theme: ThemeData(
          primaryColor: AppColor.mainColor,
        ),
      ),
    );
  }
}
