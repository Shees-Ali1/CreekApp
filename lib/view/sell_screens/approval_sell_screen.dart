import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom _backbutton.dart';
import '../../widgets/custom_route.dart';
import '../nav_bar/app_nav_bar.dart';
class ApprovalSellScreen extends StatelessWidget {
  const ApprovalSellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child:  Container(
                  // height: 200.h,
                  padding: EdgeInsets.only(bottom: 62.h),
                  decoration: const BoxDecoration(
                      color: primaryColor,

                      image: DecorationImage(image: AssetImage(AppImages.appbardesign),fit: BoxFit.cover)
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            const CustomBackButton(),

                            SizedBox(
                              width: 20.w,
                            ),
                            InterCustomText(
                              text: 'Sell Items',
                              textColor: Colors.white,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppIcons.chaticon),
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(AppIcons.notificationIcon),
                            SizedBox(
                              width: 23.w,
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),

              ),
              Container(
            margin: EdgeInsets.symmetric(vertical: 63.h),
                width: 321.w,
                padding: EdgeInsets.only(top: 63.h,),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color:  primaryColor
                    ),
                    color:  primaryColor.withOpacity(0.08)
                ),
                child: Column(

                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:12.0.w),
                      child: SizedBox(
                        width: 300.w,
                        child: InterCustomText(
                          textAlign:  TextAlign.center,
                          text: 'Your item is pending approval from Creek',
                          textColor: headingBlackColor,
                          fontsize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h,),
                    SizedBox(
                      height: 137.h,
                      width: 135.w,
                      child: Image.asset(AppImages.approvalPending),

                    ),
                    SizedBox(height: 52.h,),
                    GestureDetector(
                      onTap: () {
                    CustomRoute1.navigateAndRemoveUntil(context, const BottomNavBar(), (route) => false);
                      },
                      child: Container(
                          height: 58.h,
                          width: 284.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color:  primaryColor,
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                          child:
                          LexendCustomText(text: "Back to Home", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,)



                      ),
                    ),
                    SizedBox(height: 17.h,),

                  ],
                )
              ),







            ],
          ),
        )
    );
  }
}
