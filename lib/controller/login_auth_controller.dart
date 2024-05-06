import 'package:get/get.dart';

class LoginAuthController extends GetxController {
  RxBool loginObscure = false.obs;
  // RxBool oldpassword = false.obs;
  // RxBool newpassword = false.obs;
  // RxBool confirmpassword = false.obs;
  // RxBool signUpObscure = false.obs;
  // RxBool resetPasswordObscure = false.obs;
  // RxBool rememberMe = false.obs;

  void eyeIconLogin() {
    loginObscure.value = !loginObscure.value;
  }

  // void eyeIconSignUp() {
  //   signUpObscure.value = !signUpObscure.value;
  // }

  // void eyeIconResetPassword() {
  //   resetPasswordObscure.value = !resetPasswordObscure.value;
  // }
  //
  // void rememberMeCheck() {
  //   rememberMe.value = !rememberMe.value;
  // }
  //
  // void oldpasswordobsecure() {
  //   oldpassword.value = !oldpassword.value;
  // }
  //
  // void newpasswordobsecure() {
  //   newpassword.value = !newpassword.value;
  // }
  //
  // void confirmpasswordobsecure() {
  //   confirmpassword.value = !confirmpassword.value;
  // }
}
