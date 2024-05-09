import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/controller/login_auth_controller.dart';
import 'package:creekapp/view/nav_bar/app_nav_bar.dart';
import 'package:creekapp/view/on_boarding/on_boarding_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginAuthController loginAuthController=Get.find<LoginAuthController>();
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      loginAuthController.checkUserLogin();


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.greencreekIcon,
              height: 250.h,
              width: 250.w,
            ),
          )
        ],
      ),
    );
  }
}
