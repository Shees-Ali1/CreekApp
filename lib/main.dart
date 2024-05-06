import 'package:creekapp/view/home_screen/home_screen_books.dart';
import 'package:creekapp/view/profile_screen/profile.dart';
import 'package:creekapp/view/sell_screens/sell_screen_main.dart';
import 'package:creekapp/view/splash/splash_sceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/chat_controller.dart';
import 'controller/login_auth_controller.dart';
import 'controller/on_boarding_controller.dart';
import 'view/sell_screens/list_sell_book_screen.dart';


void main() {
  runApp(const MyApp());
  Get.put(OnBoardingController());
  Get.put(LoginAuthController());
  Get.put(ChatController());
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
            home: SellScreenMain(),
          );
        });
  }
}
