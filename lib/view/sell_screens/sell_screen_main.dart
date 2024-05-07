import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/view/sell_screens/book_sell_screen.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SellScreenMain extends StatelessWidget {
  const SellScreenMain({super.key});

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
                              text: 'Listed Items',
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
              SizedBox(height: 66.h,),
              InterCustomText(
                text: 'No items listed for sale',
                textColor: Color(0xff545454),
                fontsize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 15.h,),
              SizedBox(
                height: 223.h,
                width: 186.w,
                child: Image.asset(AppImages.sellMan),
              ),

              SizedBox(height: 24.h,),
              GestureDetector(
                onTap:(){
                  Get.to(
                    BookSellScreen(),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                } ,
                child: Container(
                  height: 39.h,
                  width: 205.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xff29604E),
                      borderRadius: BorderRadius.circular(8.r)
                  ),
                  child:
                  FittedBox(child: InterCustomText(text: "Sell your first book here!", textColor: Colors.white, fontWeight: FontWeight.w500,fontsize: 14.sp,))


                ),
              ),



            ],
          ),
        )
    );
  }
}


