import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/bookListing_controller.dart';
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

import '../../widgets/custom _backbutton.dart';

class ListSellBookScreen extends StatelessWidget {
  const ListSellBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookListingController bookListingController=Get.find();
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
                            CustomBackButton(),
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
              SizedBox(height: 14.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 24.w,),
                  InterCustomText(
                    text: 'Enter the Details of the Book',
                    textColor: Color(0xff454545),
                    fontsize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 12.h,),
              GestureDetector(
                child: Container(
                  width: 321.w,
                  height: 129.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: Color(0xff29604E)
                    ),
                      color: Color(0xff29604E).withOpacity(0.08)
                  ),
                  child: SizedBox(
                      height: 65.h,
                      width: 68.w,
                      child: Image.asset(AppImages.pickImage)),
                ),
              ),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 24.w,),

                  LexendCustomText(text: 'Title', textColor: Color(0xff1E1E1E), fontWeight: FontWeight.w500,fontsize: 16.sp,),
                ],
              ),
              // SizedBox(height: 8.h,),
              CustomSellTextField(),
              SizedBox(height: 6.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 24.w,),

                  LexendCustomText(text: 'Book Part', textColor: Color(0xff1E1E1E), fontWeight: FontWeight.w500,fontsize: 16.sp,),
                ],
              ),
              // SizedBox(height: 8.h,),
              CustomSellTextField(),
              SizedBox(height: 6.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 24.w,),

                  LexendCustomText(text: 'Author', textColor: Color(0xff1E1E1E), fontWeight: FontWeight.w500,fontsize: 16.sp,),
                ],
              ),
              // SizedBox(height: 8.h,),
              CustomSellTextField(),
              SizedBox(height: 6.h,),



              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 24.w,),

                  LexendCustomText(text: 'Class name', textColor: Color(0xff1E1E1E), fontWeight: FontWeight.w500,fontsize: 16.sp,),
                ],
              ),
              // SizedBox(height: 8.h,),
              CustomSellTextField(),
              SizedBox(height: 6.h,),


              // SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 24.w,),

                  LexendCustomText(text: 'Condition', textColor: Color(0xff1E1E1E), fontWeight: FontWeight.w500,fontsize: 16.sp,),
                ],
              ),
              SizedBox(height: 6.h,),
              Obx(() {
                return Container(
                  height: 50.h,
                  width: 327.w,

                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),

                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: DropdownButton<String>(
                      underline: SizedBox.shrink(),
                      isExpanded: true,
                      value: bookListingController.bookCondition.value,
                      items: bookListingController.bookConditions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: RalewayCustomText(text: option,
                              textColor: primaryColor,
                              fontWeight: FontWeight.w700),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // homeController.bookClass.value=newValue!;
                        bookListingController.bookCondition.value = newValue!;
                      },
                      hint: SizedBox.shrink()
                  ),
                );
              }),
              SizedBox(height: 16.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 24.w,),
                  LexendCustomText(text: 'Enter your Asking Price', textColor: Color(0xff1E1E1E), fontWeight: FontWeight.w500,fontsize: 16.sp,),
                ],
              ),
              // SizedBox(height: 8.h,),
              CustomSellTextField(prefixIcon:  Icon(
                Icons.currency_exchange_sharp,
                color: Color(0xff1E1E1E),
                size: 24.sp,
              ),keyboard: TextInputType.number,),

             SizedBox(height: 16.h,),

              GestureDetector(
                onTap: (){
                  bookListingController.addBookListing();
                  Get.to(
                    ApprovalSellScreen(),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                child: Container(
                    height: 58.h,
                    width: 322.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff29604E),
                        borderRadius: BorderRadius.circular(20.r)
                    ),
                    child:
                    LexendCustomText(text: "Next", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,)



                ),
              ),
              SizedBox(height: 32.h,),





            ],
          ),
        )
    );
  }
}

class CustomSellTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final TextInputType? keyboard;
  final Icon? suffixIcon;
  const CustomSellTextField({super.key, this.controller, this.prefixIcon, this.keyboard, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.h),
      child: SizedBox(
        width: 327.w,
        child: TextField(
          keyboardType:keyboard ,
          controller:controller ,
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
                horizontal: 16.w, vertical: 14.h),
            prefixIcon:prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: Color(0xff57C4B7)
            // hintText: 'Search',
            // hintStyle: GoogleFonts.inter(
            //     textStyle: TextStyle(
            //         color: Colors.white,
            //         fontSize: 15.11.sp,
            //         fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
