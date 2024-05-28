import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/assets/image_assets.dart';
import '../const/assets/svg_assets.dart';
import '../const/color.dart';
import '../controller/home_controller.dart';
import '../controller/user_controller.dart';
import '../view/chat_screen/main_chat.dart';
import '../view/home_screen/components/books_filter_sheet.dart';
import '../view/notification/notification_screen.dart';
import 'custom _backbutton.dart';
import 'custom_route.dart';
import 'custom_text.dart'; // For OvalBottomBorderClipper

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController;
  final String text;

  CustomAppBar({required this.homeController, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.only(bottom: 20.h), // Adjust padding as needed
        decoration: const BoxDecoration(
          color: primaryColor,
          image: DecorationImage(
            image: AssetImage(AppImages.appbardesign),
            fit: BoxFit.cover,
          ),
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
                  GestureDetector(
                    onTap: () {
                      homeController.openDrawer();
                    },
                    child: SvgPicture.asset(AppIcons.drawericon),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  InterCustomText(
                    text: text,
                    textColor: Colors.white,
                    fontsize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      CustomRoute.navigateTo(context, const MainChat());
                    },
                    child: SvgPicture.asset(AppIcons.chaticon),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      CustomRoute.navigateTo(
                          context, const NotificationScreen());
                    },
                    child: SvgPicture.asset(AppIcons.notificationIcon),
                  ),
                  SizedBox(
                    width: 23.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(160.h); // Adjust height as needed
}

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController;
  final String text;

  CustomAppBar1({required this.homeController, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.only(bottom: 20.h), // Adjust padding as needed
        decoration: const BoxDecoration(
          color: primaryColor,
          image: DecorationImage(
            image: AssetImage(AppImages.appbardesign),
            fit: BoxFit.cover,
          ),
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
                    text: text,
                    textColor: Colors.white,
                    fontsize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      CustomRoute.navigateTo(context, const MainChat());
                    },
                    child: SvgPicture.asset(AppIcons.chaticon),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      CustomRoute.navigateTo(
                          context, const NotificationScreen());
                    },
                    child: SvgPicture.asset(AppIcons.notificationIcon),
                  ),
                  SizedBox(
                    width: 23.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(160.h); // Adjust height as needed
}

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController;
  final String text;

  CustomAppBar2({required this.homeController, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.only(bottom: 20.h), // Adjust padding as needed
        decoration: const BoxDecoration(
          color: primaryColor,
          image: DecorationImage(
            image: AssetImage(AppImages.appbardesign),
            fit: BoxFit.cover,
          ),
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
                    text: text,
                    textColor: Colors.white,
                    fontsize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(160.h); // Adjust height as needed
}
class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController;
  final UserController userController;
  final FocusNode searchFocusNode = FocusNode();

  CustomAppBarHome({required this.homeController, required this.userController});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: GestureDetector(
        onTap: () {
          // Unfocus the TextField when tapping outside
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: preferredSize.height,
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
                          FocusScope.of(context).unfocus();
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
                          CustomRoute.navigateTo(context, const MainChat());
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
                        child: SvgPicture.asset(AppIcons.notificationIcon)),
                    SizedBox(
                      width: 23.w,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 273.w,
                        child: TextField(
                          controller: homeController.bookSearchController,
                          focusNode: searchFocusNode,
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
                                        topRight: Radius.circular(30.r))),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(222.h); // Adjust height as needed
}
