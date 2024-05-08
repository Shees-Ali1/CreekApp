import 'package:creekapp/controller/bookListing_controller.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/controller/sign_up_controller.dart';
import 'package:creekapp/controller/user_controller.dart';
import 'package:creekapp/view/splash/splash_sceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/chat_controller.dart';
import 'controller/login_auth_controller.dart';
import 'controller/on_boarding_controller.dart';


void main() {
  runApp(const MyApp());
  Get.put(OnBoardingController());
  Get.put(LoginAuthController());
  Get.put(SignUpController());
  Get.put(HomeController());
  Get.put(ChatController());
  Get.put(BookListingController());
  Get.put(UserController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
