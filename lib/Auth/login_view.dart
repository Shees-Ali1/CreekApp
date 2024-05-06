import 'package:creekapp/Auth/register.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/widgets/custom_button.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:creekapp/widgets/custom_textfield.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../const/assets/image_assets.dart';
import '../const/assets/svg_assets.dart';
import '../widgets/password_field.dart';
import '../controller/login_auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginAuthController loginVM = Get.find<LoginAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 66.h,
          ),
          Center(
            child: Image.asset(
              AppImages.greencreekIcon,
              height: 242.h,
              width: 187.w,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextThree(
            text: 'Enter Your Email',
            fontWeight: FontWeight.w500,
            fontsize: 16.sp,
            textColor: Color(0xff1E1E1E),
          ),
          SizedBox(
            height: 8.h,
          ),
          InputField(
            controller: emailController,
            hint: 'Enter Email',
            keyboard: TextInputType.emailAddress,
            hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomTextThree(
            text: 'Enter Your Password',
            fontWeight: FontWeight.w500,
            fontsize: 16.sp,
            textColor: Color(0xff1E1E1E),
          ),
          SizedBox(
            height: 8.h,
          ),
          Obx(() {
            return PasswordField(
              onTap: () => loginVM.eyeIconLogin(),
              controller: passwordController,
              keyboard: TextInputType.text,
              isObscure: !loginVM.loginObscure.value,
              trailIcon: loginVM.loginObscure.value
                  ? SvgPicture.asset(AppIcons.passwordeyeIcon)
                  : const Icon(
                      Icons.visibility_off_outlined,
                      size: 20,
                    ),
              hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
              hint: 'Enter Password',
            );
          }),
          SizedBox(
            height: 17.h,
          ),
          CustomButton(
            text: 'Login',
            onPressed: () {
              // Handle button press
            },
            backgroundColor: primaryColor, // Example color
            textColor: Colors.white,
          ),
          SizedBox(
            height: 17.h,
          ),
          Center(
            child: CustomTextThree(
              text: 'or Login via',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: Color(0xff3C3C43).withOpacity(0.6),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Center(
            child: Container(
              width: 154.w,
              height: 61.h,
              decoration: BoxDecoration(
                  color: Color(0xffE1E9E6),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.googleIcon),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomTextFour(
                    text: 'Google',
                    textColor: Color(0xff475569),
                    fontWeight: FontWeight.w400,
                    fontsize: 20.sp,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextThree(
                text: 'Doesn’t have account?',
                fontWeight: FontWeight.w400,
                fontsize: 14.sp,
                textColor: Color(0xff3C3C43).withOpacity(0.6),
              ),
              SizedBox(
                width: 6.w,
              ),
              GestureDetector(
                onTap: () {
                  CustomRoute.navigateTo(context,Register() );
                },
                child: CustomTextThree(
                  text: 'Register',
                  fontWeight: FontWeight.w400,
                  fontsize: 14.sp,
                  textColor: primaryColor,
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}