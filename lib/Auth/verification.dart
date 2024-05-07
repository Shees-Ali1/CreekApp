import 'package:creekapp/Auth/login_view.dart';
import 'package:creekapp/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../const/assets/image_assets.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_route.dart';
import '../widgets/custom_text.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final verifyController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56.5.w,
    height: 59.15.h,
    textStyle: GoogleFonts.montserrat(
      fontSize: 21.sp,
      color: Color(0xff101623),
      fontWeight: FontWeight.w700,
    ),
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: whiteColor,
        border: Border.all(color: primaryColor, width: 1.32),
        borderRadius: BorderRadius.circular(5.3.r)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.sp),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                        height: 44.h,
                      ),
                      LexendCustomText(
                        text: 'Verify Your Email',
                        fontWeight: FontWeight.w700,
                        fontsize: 26.sp,
                        textColor: primaryColor,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      LexendCustomText(
                        textAlign: TextAlign.center,
                        text:
                            'Enter code that we have sent to your email\nyousafayub***',
                        fontWeight: FontWeight.w400,
                        fontsize: 12.36.sp,
                        textColor: Color(0xff8A8A8E),
                      ),
                      SizedBox(
                        height: 43.h,
                      ),
                      Pinput(
                        length: 4,
                        keyboardType: TextInputType.number,
                        closeKeyboardWhenCompleted: true,
                        obscureText: false,
                        controller: verifyController,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme,
                        submittedPinTheme: defaultPinTheme,
                        textInputAction: TextInputAction.done,
                        showCursor: true,
                      ),
                      SizedBox(
                        height: 43.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LexendCustomText(
                            text: 'Didn’t receive the code?',
                            fontWeight: FontWeight.w400,
                            fontsize: 12.sp,
                            textColor: Color(0xff3C3C43).withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              // CustomRoute.navigateTo(context,LoginView() );
                            },
                            child: LexendCustomText(
                              text: 'Resend',
                              fontWeight: FontWeight.w400,
                              fontsize: 12.sp,
                              textColor: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 69.h,
                      ),
                      CustomButton(
                        text: 'Verify',
                        onPressed: () {
                          CustomRoute.navigateTo(context, LoginView());
                        },
                        backgroundColor: primaryColor, // Example color
                        textColor: Colors.white,
                      ),
                    ]))));
  }
}
