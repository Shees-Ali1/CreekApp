import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/controller/sign_up_controller.dart';
import 'package:creekapp/view/nav_bar/app_nav_bar.dart';
import 'package:creekapp/view/on_boarding/on_boarding_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        emailController.clear();
        passwordController.clear();

      } else {
        signUpController.isLoading.value = false;

        Get.snackbar("Error", "Incorrect OTP");
      }
    } catch (e) {
      signUpController.isLoading.value = false;

      print('Error Login Failed $e');
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.snackbar('Success', 'You have been logout');
      Get.offAll(const LoginView());
    } catch (e) {
      print('Error Logout Failed $e');
    }
  }

  void checkUserLogin() async {
    try {
      if (FirebaseAuth.instance.currentUser?.uid != null) {

        Get.offAll(BottomNavBar());
      } else {
        Get.offAll(OnBoarding());
      }
    } catch (e) {
      print("User is not login $e");
    }
  }

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future<void> handleGoogleSignIn() async {
   try{ final auth = FirebaseAuth.instance;
   final _firestore = FirebaseFirestore.instance; // Initialize Firestore

   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
   if (googleUser == null) {
     // Handle null Google user
     return;
   }
   // Obtain the auth details from the request.
   final GoogleSignInAuthentication googleAuth =
   await googleUser.authentication;
   // Create a new credential.
   final OAuthCredential googleCredential = GoogleAuthProvider.credential(
     accessToken: googleAuth.accessToken,
     idToken: googleAuth.idToken,
   );
   // Sign in to Firebase with the Google [UserCredential].
   final UserCredential userCredential =
   await FirebaseAuth.instance.signInWithCredential(googleCredential);

   final user = userCredential.user!;
   final uid = user.uid;

   // if (user != null) {
   //   String? deviceToken = await FirebaseMessaging.instance.getToken();
   //   if (deviceToken != null) {
   //     await FirebaseFirestore.instance
   //         .collection('userDetails')
   //         .doc(user.uid)
   //         .update({
   //       'deviceToken': deviceToken,
   //     });
   //   }
   // }
   // Check if the user already exists in the Firestore collection
   final userDoc = await _firestore.collection('userDetails').doc(uid).get();
   if (!userDoc.exists) {
     // User does not exist in the collection, proceed to store their data
     String? uName = user.displayName;
     String? uEmail = user.email;
     String? uPhoto = user.photoURL;

     // if (uPhoto != null) {
     //   print('Photo URL: $uPhoto');
     // } else {
     //   print('Photo URL not available');
     // }
     // if (uName != null) {
     //   print('Google user name: $uName');
     // } else {
     //   print('Google user name not available');
     // }
     // if (uEmail != null) {
     //   print('uEmail : $uEmail');
     // } else {
     //   print('uEmail not available');
     // }

     // Store user data in Firestore
     await _firestore.collection('userDetails').doc(uid).set({
       'userId': uid,
       'userEmail': uEmail,
       'userImage': uPhoto,
       'userName': uName,
       // 'pushToken': devicetoken,
     });
     // _authController.signupName.value = uName!;
     // _authController.signupEmail.value = uEmail!;
     // _authController.profileURL.value = uPhoto!;
     // _authController.fromLogin.value = true;
     // Navigator.of(context).pop();
     // Get.offAll(const MainAuthProgressScreen());
     Get.back();
     // Proceed with navigation or other actions
     Get.offAll(BottomNavBar());
   } else {
     Get.back();
     // Proceed with navigation or other actions
     Get.offAll(BottomNavBar());
   }
   }catch(e){
     print("error sign in with googleee $e");
   }
    // Get.snackbar('Welcome', 'Welcome Back');
  }
}
