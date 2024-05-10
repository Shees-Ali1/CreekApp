import 'package:creekapp/controller/sign_up_controller.dart';
import 'package:creekapp/view/nav_bar/app_nav_bar.dart';
import 'package:creekapp/view/on_boarding/on_boarding_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Auth/login_view.dart';
import '../Auth/signup_profile_pic.dart';

class LoginAuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final SignUpController signUpController = Get.find<SignUpController>();
  RxBool loginObscure = false.obs;


  void eyeIconLogin() {
    loginObscure.value = !loginObscure.value;
  }

  void loginUser() async {
    try {
      signUpController.isLoading.value = true;

      if (emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty) {
        signUpController.isLoading.value = false;

        return;
      }

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      if (FirebaseAuth.instance.currentUser!.uid != null) {
        // SharedPreferences prefs  = await SharedPreferences.getInstance();
        // await prefs.setString('email', emailController.text);
        // await prefs.setString('password', passwordController.text);
        signUpController.isLoading.value = false;
        Get.snackbar('Success', 'Login Success');
        Get.offAll(const BottomNavBar());
      } else {
        signUpController.isLoading.value = false;

        Get.snackbar("Error", "Incorrect OTP");
      }
    } catch (e) {
      signUpController.isLoading.value = false;

      print('Error Login Failed $e');
    }
  }
 Future <void> logOut() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.snackbar('Success', 'You have been logout');
      Get.offAll(const LoginView());

    }
        catch(e){
      print('Error Logout Failed $e');
        }
  }
  void checkUserLogin()async{
  try{
    if( FirebaseAuth.instance.currentUser?.uid!= null){

      Get.offAll(BottomNavBar());
    }else{
      Get.offAll(OnBoarding());

    }
  }catch(e){
    print("User is not login $e");
  }
  }


}
