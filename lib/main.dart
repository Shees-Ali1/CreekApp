import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/controller/bookListing_controller.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/controller/sign_up_controller.dart';
import 'package:creekapp/controller/user_controller.dart';
import 'package:creekapp/firebase_options.dart';
import 'package:creekapp/view/splash/splash_sceen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/chat_controller.dart';
import 'controller/login_auth_controller.dart';
import 'controller/on_boarding_controller.dart';
import 'helper/bindings.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
FirebaseFirestore.instance.settings=const Settings(persistenceEnabled: true,cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return  GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            initialBinding: UserBinding(),
          );
        });
  }
}
