import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/view/sell_screens/list_sell_book_screen.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/assets/svg_assets.dart';

class BookSellScreen extends StatelessWidget {
  const BookSellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                            CustomText(
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
               SizedBox(height: 114.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 25.w,),
                  CustomText(
                    text: 'Enter ISBN Number',
                    textColor: Color(0xff454545),
                    fontsize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 16.h,),
              SizedBox(
                width: 327.w,
                child: TextField(
                  style: GoogleFonts.lexend(
                      textStyle: TextStyle(
                          color: Color(0xff1E1E1E),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xff29604E).withOpacity(0.08),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 16.h),
                    // prefixIcon: Icon(
                    //   Icons.search,
                    //   color: Colors.white,
                    // ),
                    // hintText: 'Search',
                    // hintStyle: GoogleFonts.inter(
                    //     textStyle: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 15.11.sp,
                    //         fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              CustomText(
                text: 'or',
                textColor: Color(0xff454545),
                fontsize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: 'Click to Scan',
                textColor: Color(0xff454545),
                fontsize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 119.h,
                width: 111.w,
                child: Image.asset(AppImages.qrscan),
              ),
              SizedBox(height: 28.h,),

              Container(
                height: 58.h,
                width: 322.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xff29604E),
                    borderRadius: BorderRadius.circular(20.r)
                ),
                child:
                CustomTextThree(text: "Confirm", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,)



              ),
              SizedBox(height: 32.h,),
              GestureDetector(
                onTap:(){
                  Get.to(
                    ListSellBookScreen(),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                } ,
                child: Container(
                  height: 58.h,
                  width: 322.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xff29604E).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child:
                  CustomTextThree(text: "Skip to Enter details Manually", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,)



                ),
              ),
              SizedBox(height: 20.h,),




            ],
          ),
        )
    );
  }
}
