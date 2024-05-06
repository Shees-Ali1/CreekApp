import 'package:creekapp/const/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../const/assets/image_assets.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_route.dart';
import '../widgets/custom_text.dart';
import 'signup.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 33.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 95.h,
              ),
              Center(
                child: Image.asset(
                  AppImages.ilustrationRegister,
                  height: 288.h,
                  width: 434.w,
                ),
              ),
              SizedBox(
                height: 91.h,
              ),
              CustomTextThree(
                text: 'Create Your Profile',
                fontWeight: FontWeight.w400,
                fontsize: 32.sp,
                textColor: Color(0xff273958),
              ),
              CustomTextThree(
                text: 'Now!',
                fontWeight: FontWeight.w600,
                fontsize: 32.sp,
                textColor: Color(0xff273958),
              ),
              SizedBox(
                height: 28.h,
              ),
              CustomTextThree(
                text:
                    ' Create a profile to save your learning\n progress and keep learning for free!',
                fontWeight: FontWeight.w400,
                fontsize: 14.sp,
                textColor: Color(0xff989EA7),
              ),
              SizedBox(
                height: 80.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 60.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigator?.pop();
                      },
                      child: CustomTextThree(
                        text: 'Back',
                        fontWeight: FontWeight.w500,
                        fontsize: 16.sp,
                        textColor: primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        CustomRoute.navigateTo(context, Signup());
                      },
                      child: Container(
                          width: 127.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(40.r)),
                          child: Center(
                            child: CustomTextThree(
                              textColor: whiteColor,
                              fontsize: 16.sp,
                              text: 'Next',
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    )
                  ],
                ),
              )
            ])));
  }
}
