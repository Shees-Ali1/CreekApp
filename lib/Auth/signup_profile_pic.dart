import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/view/nav_bar/app_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../const/assets/image_assets.dart';
import '../controller/sign_up_controller.dart';
import '../controller/user_controller.dart';
import '../widgets/custom_route.dart';
import '../widgets/custom_text.dart';

class SignupProfilePic extends StatelessWidget {
  const SignupProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    final SignUpController signupController = Get.find<SignUpController>();

    return Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 25.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 46.h,
              ),
              Center(
                child: Image.asset(
                  AppImages.greencreekIcon,
                  height: 168.h,
                  width: 130.w,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              GetBuilder<UserController>(builder: (userController) {
                return userController.imageFile != null
                    ? GestureDetector(
                        onTap: () {
                          userController.pickImage();
                        },
                        child: Center(
                          child: Container(
                            height: 106.78.h,
                            width: 106.78.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: FileImage(
                                      userController.imageFile!,
                                      // height: 14.h,
                                      // width: 26.w,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          userController.pickImage();
                        },
                        child: Center(
                            child: CircleAvatar(
                          backgroundColor: primaryColor.withOpacity(0.7),
                          radius: 60.r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.upload,
                                color: whiteColor,
                                scale: 3,
                              ),
                              LexendCustomText(
                                text: 'Upload Image',
                                fontWeight: FontWeight.w500,
                                fontsize: 12.sp,
                                textColor: whiteColor,
                              ),
                            ],
                          ),
                        )),
                      );
              }),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: 60.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offAll(BottomNavBar());
                      },
                      child: LexendCustomText(
                        text: 'Skip',
                        fontWeight: FontWeight.w500,
                        fontsize: 16.sp,
                        textColor: primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String imageUrl = await signupController.uploadImage(
                            FirebaseAuth.instance.currentUser!.uid);
                        await FirebaseFirestore.instance
                            .collection('userDetails')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .set({'userImage': imageUrl},
                                SetOptions(merge: true));
                        userController.userImage.value = imageUrl;
                        CustomRoute.navigateTo(context, const BottomNavBar());
                      },
                      child: Container(
                          width: 127.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(40.r)),
                          child: Center(
                            child: LexendCustomText(
                              textColor: whiteColor,
                              fontsize: 16.sp,
                              text: 'Upload',
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ])));
  }
}
