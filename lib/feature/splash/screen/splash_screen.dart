import 'dart:async';

import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:books_app/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print('hello splash screen');
    Timer(const Duration(seconds: 1), () {
      _naviagate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/image_splash.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _naviagate() async {
    bool check = false;
    bool firstTimeUseApp = false;
    await StorageHelper.isKeyExist(APIKey.token).then((value) {
      check = value;
    });
    await StorageHelper.isKeyExist("FirstTimeUseApp").then((value) {
      firstTimeUseApp = value;
    });

    if (firstTimeUseApp == false) {
      await addKey();
    }
    _navigatToNextScreen(check, firstTimeUseApp);
  }

  void _navigatToNextScreen(bool check, bool isFirst) {
    if (check) {
      Get.offAllNamed(RoutesName.homelayout);
    } else if (isFirst == false) {
      Get.offAllNamed(RoutesName.boardingScreen);
    } else {
      Get.offAllNamed(RoutesName.login);
    }
  }

  Future<void> addKey() async {
    StorageHelper.addKey(key: "FirstTimeUseApp", value: "key");
    print(StorageHelper.isKeyExist("FirstTimeUseApp"));
  }
}
