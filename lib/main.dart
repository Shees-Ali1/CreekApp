import 'package:creekapp/view/profile_screen/profile.dart';
import 'package:creekapp/view/splash/splash_sceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/login_auth_controller.dart';
import 'controller/on_boarding_controller.dart';


void main() {
  runApp(const MyApp());
  Get.put(OnBoardingController());
  Get.put(LoginAuthController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
