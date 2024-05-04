
import 'package:creekapp/view/on_boarding/on_boarding_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller/on_boarding_controller.dart';
import 'view/splash/splash_sceen.dart';

void main() {
  runApp(const MyApp());
  Get.put(OnBoardingController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      designSize: Size(375,812),
        builder: (_ , child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        }
    );
  }
}

