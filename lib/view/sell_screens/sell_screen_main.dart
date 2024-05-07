import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/controller/bookListing_controller.dart';
import 'package:creekapp/view/chat_screen/main_chat.dart';
import 'package:creekapp/view/home_screen/book_details_screen.dart';
import 'package:creekapp/view/sell_screens/book_sell_screen.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_route.dart';
import '../notification/notification_screen.dart';

class SellScreenMain extends StatelessWidget {
  const SellScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    final BookListingController bookListingController = Get.find();
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  // height: 200.h,
                  padding: EdgeInsets.only(bottom: 62.h),
                  decoration: BoxDecoration(
                      color: Color(0xff29604E),

                      image: DecorationImage(image: AssetImage(AppImages
                          .appbardesign), fit: BoxFit.cover)
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
                            GestureDetector(
                                onTap: () {
                                  CustomRoute.navigateTo(context, MainChat());
                                },
                                child: SvgPicture.asset(AppIcons.chaticon)),
                            SizedBox(
                              width: 10.w,
                            ),
                            GestureDetector(
                                onTap: () {
                                  CustomRoute.navigateTo(context, NotificationScreen());
                                },
                                child: SvgPicture.asset(AppIcons.notificationIcon)),
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
              Obx(() =>  bookListingController.mySellListings.isEmpty ?
              Column(
                children: [
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
                    onTap: () {
                      Get.to(
                        BookSellScreen(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Container(
                        height: 39.h,
                        width: 205.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff29604E),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child:
                        FittedBox(child: InterCustomText(
                          text: "Sell your first book here!",
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontsize: 14.sp,))


                    ),
                  ),

                ],
              ) :
              Column(
                children: [
                  SizedBox(height: 18.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 36.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              BookSellScreen(),
                              transition: Transition.fade,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                              height: 39.h,
                              width: 142.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff29604E),
                                  borderRadius: BorderRadius.circular(8.r)
                              ),
                              child:
                              FittedBox(child: Row(
                                children: [
                                  Icon(Icons.add, color: Colors.white,),
                                  InterCustomText(text: "Add new Book",
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontsize: 14.sp,),
                                ],
                              ))


                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  ListView.builder(
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: bookListingController.mySellListings.length,
                      itemBuilder: (context, index) {
                        final books = bookListingController
                            .mySellListings[index];
                        return GestureDetector(
                            onTap: () {
                              Get.to(
                                BookDetailsScreen(bookDetail: books, index: index, comingfromSellScreen: true,),
                                transition: Transition.fade,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Stack(
                              children: [

                                Container(
                                  height: 125.23.h,
                                  width: 303.w,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 36.w),
                                  decoration: BoxDecoration(
                                    color:  Colors.white,
                                      boxShadow: [
                                        books['approval']==true?  BoxShadow(
                                          color: Color(0xff9EC6B9),
                                          blurRadius: 20,
                                          offset: Offset(0, 4.h)
                                      ): BoxShadow(
                                            color: Colors.transparent,
                                            // blurRadius: 20,
                                            // offset: Offset(0, 4.h)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(9.89.r)
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(9.89.r),
                                                bottomLeft: Radius.circular(
                                                    9.89.r)),
                                            child: SizedBox(
                                              height: 125.23.h,
                                              width: 77.w,
                                              child: books['bookImage'] != ''
                                                  ? Image.asset(
                                                books['bookImage'].toString(),
                                                fit: BoxFit.cover,)
                                                  : Container(color: Colors.red,),
                                            ),
                                          ),
                                          SizedBox(width: 5.w,),
                                          FittedBox(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                SizedBox(height: 3.h,),
                                                SizedBox(
                                                    width: 214.w,
                                                    child: MontserratCustomText(
                                                      text: books['bookName'],
                                                      fontsize: 16.sp,
                                                      textColor: Color(
                                                          0xff393939),
                                                      fontWeight: FontWeight.w600,
                                                      height: 1,)),
                                                SizedBox(height: 5.h,),
                                                SizedBox(
                                                  width: 180.w,
                                                  child: MontserratCustomText(
                                                    overflow: TextOverflow.ellipsis,
                                                      text: books['bookPart'] ?? '',
                                                      fontsize: 10.sp,
                                                      textColor: Color(0xff5C5C5C),
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(height: 14.h,),
                                                MontserratCustomText(
                                                  text: "Author: ${books['bookAuthor']}",
                                                  fontsize: 10.sp,
                                                  textColor: Color(0xff5C5C5C),
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.h,),
                                                SizedBox(height: 14.h,),
                                                MontserratCustomText(
                                                    text: "Class: ${books['bookClass']}",
                                                    fontsize: 8.sp,
                                                    textColor: Color(0xff5C5C5C),
                                                    fontWeight: FontWeight.w600),
                                                MontserratCustomText(
                                                    text: "Condition: ${books['bookCondition']}",
                                                    fontsize: 8.sp,
                                                    textColor: Color(0xff5C5C5C),
                                                    fontWeight: FontWeight.w600),
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
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.r),
                                                bottomRight: Radius.circular(
                                                    10.r))
                                        ),
                                        child: MontserratCustomText(
                                          text: "\$${books['bookPrice']
                                              .toString()}",
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontsize: 14.sp,),
                                      ),
                                      Positioned(
                                          top: 0.h,
                                          bottom: 25.h,
                                          right: 3.h,
                                          child: SizedBox(height: 24.h,width: 24.w,child: SvgPicture.asset(AppIcons.editIcon,color: Color(0xff29604E),),))
                                    ],
                                  ),

                                ),
                               books['approval']==false? Container(
                                 alignment: Alignment.bottomLeft,
                                  height: 125.23.h,
                                  width: 303.w,
                                  padding: EdgeInsets.only(left:11.w),

                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 36.w),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(9.89.r),
                                 color:  Color(0xff404040).withOpacity(0.6),


                               ),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     SizedBox(height: 5.h,),
                                     SizedBox(
                                         height: 48.h,
                                         width: 47.w,
                                         child: Image.asset(AppImages.approvalPending,color: Colors.white,)),
                                     InterCustomText(text: 'Pending\nApproval', textColor: Colors.white, fontWeight: FontWeight.w500,fontsize: 12.sp,textAlign: TextAlign.center,),
                                     SizedBox(height: 3.h,),

                                   ],
                                 ),
                               ):SizedBox.shrink(),
                              ],
                            )
                        );
                      }),
                ],
              ))




            ],
          ),
        )
    );
  }
}


