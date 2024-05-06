import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
                      child: Container(
                        margin: EdgeInsets.only(top: 5.h),
                        width: 38.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff29604E)
                        ),
                        child: Icon(Icons.arrow_back,color: Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
             SizedBox(height: 15.h,),
             SizedBox(
                  width: 297.w,
        
                  child: CustomTextTwo(text: bookDetail['bookName'], textColor: Colors.black, fontWeight: FontWeight.w700,fontsize: 24.sp,)),
             SizedBox(height: 5.h,),
             CustomTextTwo(text: bookDetail['bookPart'], textColor: Colors.black, fontWeight: FontWeight.w600,fontsize: 18.sp,),
             SizedBox(height: 20.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomTextTwo(text: 'Date Posted', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                 CustomTextTwo(text: bookDetail['bookPosted'], textColor: Color(0xff919191), fontWeight: FontWeight.w500,fontsize: 16.sp,),
               ],
             ),
              SizedBox(height: 15.h,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomTextTwo(text: 'Author', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                 CustomTextTwo(text: bookDetail['bookAuthor'], textColor: Color(0xff919191), fontWeight: FontWeight.w500,fontsize: 16.sp,),
               ],
             ),
              SizedBox(height: 15.h,),
        
              CustomTextTwo(text: 'Description', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
              SizedBox(height: 6.h,),
              SizedBox(
              width:   319.w,
                  child: CustomTextTwo(text: bookDetail['bookDescription'], textColor: Color(0xff919191), fontWeight: FontWeight.w500,fontsize: 16.sp,)),
              SizedBox(height: 6.h,),
              bookDetail['sellerId']=='qwerty'?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextTwo(text: 'Price', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                  CustomTextTwo(text: "\$${bookDetail['bookPrice']}", textColor: Color(0xff919191), fontWeight: FontWeight.w500,fontsize: 16.sp,),
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
                                CustomTextFour(text: "Book Purchased!", textColor: Color(0xff29604E), fontWeight: FontWeight.w700,fontsize: 22.sp,),
                                SizedBox(height: 15.h,),
                                CustomTextFour(text: "You bought this book from Sue S. You can now chat with Sue S about delivering the book at school.", textColor: Color(0xff010101), fontWeight: FontWeight.w400,fontsize: 14.sp,),
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
                                      CustomTextFive(text: "Home", textColor: Color(0xffFEFEFE), fontWeight: FontWeight.w600,fontsize: 16.sp,)
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
                    CustomTextThree(text: "Cancel This Listing", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,):

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextThree(text: "Add to Cart ", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,),

                        CustomTextThree(text: "\$${bookDetail['bookPrice'].toString()}", textColor: Colors.white, fontWeight: FontWeight.w600,fontsize: 24.sp,),
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
