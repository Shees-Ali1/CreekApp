import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/view/sell_screens/approval_sell_screen.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  decoration: BoxDecoration(
                      color: Color(0xff29604E),

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
                            SvgPicture.asset(AppIcons.drawericon),
                            SizedBox(
                              width: 20.w,
                            ),
                            InterCustomText(
                              text: 'Sell Items',
                              textColor: Colors.white,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            Spacer(),
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
                        color: Color(0xff29604E)
                    ),
                    color: Color(0xff29604E).withOpacity(0.08)
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
                          textColor: Color(0xff454545),
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
                    Container(
                        height: 58.h,
                        width: 284.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff29604E),
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                        child:
                        LexendCustomText(text: "Back to Home", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,)



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
