import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../widgets/custom _backbutton.dart';

class BookDetailsScreen extends StatelessWidget {
  final dynamic bookDetail;
  const BookDetailsScreen({super.key, required this.bookDetail});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 28.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 400.h,
                      width: 282.w,
                     child:  Image.asset(bookDetail['bookImage']),
                    ),
                  ),
                  SafeArea(
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child:CustomBackButton()
                    ),
                  )
                ],
              ),
             SizedBox(height: 15.h,),
             SizedBox(
                  width: 297.w,
        
                  child: MontserratCustomText(text: bookDetail['bookName'], textColor: Colors.black, fontWeight: FontWeight.w700,fontsize: 24.sp,)),
             SizedBox(height: 5.h,),
             MontserratCustomText(text: bookDetail['bookPart'], textColor: Colors.black, fontWeight: FontWeight.w600,fontsize: 18.sp,),
             SizedBox(height: 20.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 MontserratCustomText(text: 'Date Posted', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                 MontserratCustomText(text: bookDetail['bookPosted'], textColor: Color(0xff919191), fontWeight: FontWeight.w500,fontsize: 16.sp,),
               ],
             ),
              SizedBox(height: 15.h,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 MontserratCustomText(text: 'Author', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                 MontserratCustomText(text: bookDetail['bookAuthor'], textColor: Color(0xff919191), fontWeight: FontWeight.w500,fontsize: 16.sp,),
               ],
             ),
              SizedBox(height: 15.h,),
        
              MontserratCustomText(text: 'Description', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
              SizedBox(height: 6.h,),
              SizedBox(
              width:   319.w,
                  child: MontserratCustomText(text: bookDetail['bookDescription'], textColor: Color(0xff919191), fontWeight: FontWeight.w500,fontsize: 16.sp,)),
              SizedBox(height: 6.h,),
              bookDetail['sellerId']=='qwerty'?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MontserratCustomText(text: 'Price', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                  MontserratCustomText(text: "\$${bookDetail['bookPrice']}", textColor: Color(0xff919191), fontWeight: FontWeight.w500,fontsize: 16.sp,),
                ],
              ) :
              SizedBox.shrink(),
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // title: Text('Hello!'),

                        content: Container(
                            // height: 335.h,
                            width: 404.w,
                            child:Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 159.h,
                                  width: 163.w,
                                  child: Image.asset(AppImages.doneTick),
                                ),
                                WorkSansCustomText(text: "Book Purchased!", textColor: Color(0xff29604E), fontWeight: FontWeight.w700,fontsize: 22.sp,),
                                SizedBox(height: 15.h,),
                                WorkSansCustomText(text: "You bought this book from Sue S. You can now chat with Sue S about delivering the book at school.", textColor: Color(0xff010101), fontWeight: FontWeight.w400,fontsize: 14.sp,),
                                SizedBox(height: 14.h,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Container(
                                      height: 54.h,
                                      width: 154.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xff29604E),
                                          borderRadius: BorderRadius.circular(20.r)
                                      ),
                                      child:
                                      PoppinsCustomText(text: "Home", textColor: Color(0xffFEFEFE), fontWeight: FontWeight.w600,fontsize: 16.sp,)
                                    ),

                                    SizedBox(width: 15.w,),
                                    SizedBox(
                                      height: 54.h,
                                      width: 61.w,
                                      child: SvgPicture.asset(AppIcons.msgIcon),
                                    ),
                                  ],
                                ),


                              ],
                            )

                        ),

                      );
                    },
                  );
                },
                child: Center(
                  child: Container(
                    height: 58.h,
                    width: 327.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff29604E),
                      borderRadius: BorderRadius.circular(20.r)
                    ),
                    child: bookDetail['sellerId']=='qwerty'?
                    LexendCustomText(text: "Cancel This Listing", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,):

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LexendCustomText(text: "Add to Cart ", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,),

                        LexendCustomText(text: "\$${bookDetail['bookPrice'].toString()}", textColor: Colors.white, fontWeight: FontWeight.w600,fontsize: 24.sp,),
                      ],
                    ),

                  ),
                ),
              ),
              SizedBox(height: 20.h,),
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
