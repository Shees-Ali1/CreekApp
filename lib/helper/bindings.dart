import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/controller/bookListing_controller.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/controller/notification_controller.dart';
import 'package:creekapp/controller/order_controller.dart';
import 'package:creekapp/controller/sign_up_controller.dart';
import 'package:creekapp/controller/user_controller.dart';
import 'package:creekapp/firebase_options.dart';
import 'package:creekapp/view/splash/splash_sceen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/chat_controller.dart';
import '../controller/login_auth_controller.dart';
import '../controller/on_boarding_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
    Get.put(SignUpController());
    Get.put(LoginAuthController());
    Get.put(HomeController());
    Get.put(ChatController());
    Get.put(BookListingController());
    Get.put(UserController());
    Get.put(NotificationController());
    Get.put(OrderController());
  }
}
