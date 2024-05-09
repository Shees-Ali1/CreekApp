import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/controller/user_controller.dart';
import 'package:creekapp/view/chat_screen/main_chat.dart';
import 'package:creekapp/view/drawer/drawer.dart';
import 'package:creekapp/view/home_screen/book_details_screen.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_route.dart';
import '../notification/notification_screen.dart';
import 'components/books_filter_sheet.dart';

class HomeScreenBooks extends StatelessWidget {
  const HomeScreenBooks({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final UserController userController = Get.find<UserController>();
    // final TextEditingController bookController=TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // key: homeController.scaffoldKey,
        // drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  // height: 200.h,
                  // padding: EdgeInsets.symmetric(vertical: 50.h),
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      image: DecorationImage(
                          image: AssetImage(AppImages.appbardesign),
                          fit: BoxFit.cover)),
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
                            GestureDetector(
                                onTap: () {
                                  homeController.openDrawer();
                                },
                                child: SvgPicture.asset(AppIcons.drawericon)),
                            SizedBox(
                              width: 20.w,
                            ),
                            Obx(() {
                              return SizedBox(
                                width: 210.w,
                                child: InterCustomText(
                                  text: 'Hey, ${userController.userName.value}',
                                  textColor: Colors.white,
                                  fontsize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              );
                            }),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  CustomRoute.navigateTo(
                                      context, const MainChat());
                                },
                                child: SvgPicture.asset(AppIcons.chaticon)),
                            SizedBox(
                              width: 10.w,
                            ),
                            GestureDetector(
                                onTap: () {
                                  CustomRoute.navigateTo(
                                      context, const NotificationScreen());
                                },
                                child: SvgPicture.asset(
                                    AppIcons.notificationIcon)),
                            SizedBox(
                              width: 23.w,
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 273.w,
                                child: TextField(
                                  controller: homeController
                                      .bookSearchController,

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
                                    prefixIcon: const Icon(
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
                              SizedBox(
                                width: 8.w,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      isScrollControlled: true,
                                      Container(
                                        width: double.infinity,
                                        height: 703.h,
                                        padding: EdgeInsets.all(20.sp),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30.r),
                                                topRight:
                                                Radius.circular(30.r))),
                                        child: const BooksFilterBottomSheet(),
                                      ),
                                    );
                                  },
                                  child: SvgPicture.asset(AppIcons.filtericon)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Obx(() {
                return ListView.builder(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeController.filteredBooks.length,
                    itemBuilder: (context, index) {
                      final books = homeController.filteredBooks[index];
                      return GestureDetector(
                          onTap: () {
                            Get.to(
                              BookDetailsScreen(
                                bookDetail: books,
                                index: index,
                                comingfromSellScreen: false,
                              ),
                              transition: Transition.fade,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                            height: 125.23.h,
                            width: 303.w,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 36.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: shadowColor,
                                      blurRadius: 20,
                                      offset: Offset(0, 4.h))
                                ],
                                borderRadius: BorderRadius.circular(9.89.r)),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(9.89.r),
                                          bottomLeft: Radius.circular(9.89.r)),
                                      child: SizedBox(
                                        height: 125.23.h,
                                        width: 77.w,
                                        child: books['bookImage'] != ''
                                            ? Image.network(
                                          books['bookImage'].toString(),
                                          fit: BoxFit.fill,
                                        )
                                            : Container(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          SizedBox(
                                              width: 214.w,
                                              child: MontserratCustomText(
                                                text: books['bookName'],
                                                fontsize: 16.sp,
                                                textColor: textColor,
                                                fontWeight: FontWeight.w600,
                                                height: 1,
                                              )),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          MontserratCustomText(
                                              text: books['bookPart'] ?? '',
                                              fontsize: 12.sp,
                                              textColor: mainTextColor,
                                              fontWeight: FontWeight.w600),
                                          SizedBox(
                                            height: 14.h,
                                          ),
                                          MontserratCustomText(
                                            text:
                                            "Author: ${books['bookAuthor']}",
                                            fontsize: 10.sp,
                                            textColor: mainTextColor,
                                            fontWeight: FontWeight.w600,
                                            height: 1.h,
                                          ),
                                          SizedBox(
                                            height: 14.h,
                                          ),
                                          MontserratCustomText(
                                              text:
                                              "Class: ${books['bookClass']}",
                                              fontsize: 8.sp,
                                              textColor: mainTextColor,
                                              fontWeight: FontWeight.w600),
                                          MontserratCustomText(
                                              text:
                                              "Condition: ${books['bookCondition']}",
                                              fontsize: 8.sp,
                                              textColor: mainTextColor,
                                              fontWeight: FontWeight.w600),
                                          SizedBox(
                                            height: 3.h,
                                          ),
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
                                      color: primaryColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.r),
                                          bottomRight: Radius.circular(10.r))),
                                  child: MontserratCustomText(
                                    text: "\$${books['bookPrice'].toString()}",
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontsize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ));
                    });
              }),
              SizedBox(
                height: 18.h,
              ),
            ],
          ),
        ));
  }
}
