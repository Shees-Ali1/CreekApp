import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/view/home_screen/components/book_details_screen.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenBooks extends StatelessWidget {
  const HomeScreenBooks({super.key});

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
                // padding: EdgeInsets.symmetric(vertical: 50.h),
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
                            text: 'Hey, Ali',
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
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 40.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 273.w,
                              child: TextField(
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.11.sp,
                                        fontWeight: FontWeight.w500)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Colors.black.withOpacity(0.45),
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 15.h),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Search',
                                  hintStyle: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.11.sp,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w,),
                            SvgPicture.asset(AppIcons.filtericon),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ),
            SizedBox(height: 18.h,),
            ListView.builder(
                clipBehavior: Clip.none,
                padding:EdgeInsets.zero ,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bookListing.length,
                itemBuilder: (context,index){
                  final books=bookListing[index];
                  return GestureDetector(
                    onTap:(){
                      Get.to(
                         BookDetailsScreen(bookDetail: books,),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    } ,
                    child: Container(
                      height: 125.23.h,
                      width: 303.w,
                      margin: EdgeInsets.symmetric(vertical:8.h,horizontal: 36.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                              color: Color(0xff9EC6B9),
                              blurRadius: 20,
                              offset: Offset(0,4.h)
                          )],
                          borderRadius: BorderRadius.circular(9.89.r)
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(9.89.r),bottomLeft: Radius.circular(9.89.r)),
                                child: SizedBox(
                                  height:  125.23.h,
                                  width: 77.w,
                                child: books['bookImage']!=''?Image.asset(books['bookImage'].toString(),fit: BoxFit.cover,):Container(color: Colors.red,),
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 3.h,),
                                    SizedBox(
                                        width: 214.w,
                                        child: MontserratCustomText(text: books['bookName'],fontsize: 16.sp, textColor: Color(0xff393939), fontWeight: FontWeight.w600,height: 1,)),
                                    SizedBox(height: 5.h,),
                                    MontserratCustomText(text: books['bookPart']??'',fontsize: 12.sp, textColor: Color(0xff5C5C5C), fontWeight: FontWeight.w600),
                                    SizedBox(height: 14.h,),
                                    MontserratCustomText(text: "Author: ${books['bookAuthor']}",fontsize: 10.sp, textColor: Color(0xff5C5C5C), fontWeight: FontWeight.w600,height: 1.h,),
                                    SizedBox(height: 14.h,),
                                    MontserratCustomText(text: "Class: ${books['bookClass']}",fontsize: 8.sp, textColor: Color(0xff5C5C5C), fontWeight: FontWeight.w600),
                                    MontserratCustomText(text: "Condition: ${books['bookCondition']}",fontsize: 8.sp, textColor: Color(0xff5C5C5C), fontWeight: FontWeight.w600),
                                    SizedBox(height: 3.h,),



                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: 71.w,
                            height: 29.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xff29604E),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r))
                            ),
                            child: MontserratCustomText(text: "\$${books['bookPrice'].toString()}", textColor: Colors.white, fontWeight: FontWeight.w700,fontsize: 14.sp,),
                          )
                        ],
                      ),

                    )
                  );
                })

          ],
        ),
      )
    );
  }
}
List<dynamic> bookListing=[
  {
    'bookImage':AppImages.harryPotterBook,
    'bookName':'Harry Potter and the cursed child',
    'bookPart':'Parts One And Two',
    'bookAuthor':'J.K. Rowling',
    'bookClass':'Graduate',
    'bookCondition':'New',
    'bookPrice':100,
    'bookPosted':'20 May 2025',
    'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. '
  },
  {
    'bookImage':AppImages.soulBook,
    'bookName':'Soul',
    'bookPart':'',
    'bookAuthor':' Olivia Wilson',
    'bookClass':'Graduate',
    'bookCondition':'New',
    'bookPrice':100,
    'bookPosted':'20 May 2025',
    'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. '
  },
  {
    'bookImage':AppImages.milliontoone ,
    'bookName':'A MILLION TO ONE',
    'bookPart':'The Fassano Trilogy - Book Two',
    'bookAuthor':'Tony Faggioli',
    'bookClass':'Graduate',
    'bookCondition':'Used',
    'bookPrice':70,
    'bookPosted':'20 May 2025',
    'sellerId':'qwerty',
    'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. '
  },


];