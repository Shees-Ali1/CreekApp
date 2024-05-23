import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/firebase_options.dart';
import 'package:creekapp/view/splash/splash_sceen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'helper/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  Stripe.publishableKey =
      'pk_test_51PF3XJBD4iwEMWA71oP6QcS34JmsEtg5YpV8xaQU00Yp0PDChH3mgoIbOx4HTt6MPQHcEy6T6Vcf43Mjiz5XReRi00HEGgYPzh';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            initialBinding: UserBinding(),
          );
        });
  }
}
