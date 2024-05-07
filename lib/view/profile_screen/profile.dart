import 'package:creekapp/Auth/login_view.dart';
import 'package:creekapp/view/profile_screen/components/term-Cond.dart';
import 'package:creekapp/widgets/custom_button.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:creekapp/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../const/assets/image_assets.dart';
import '../../const/assets/svg_assets.dart';
import '../../const/color.dart';
import '../../widgets/custom_text.dart';
import '../chat_screen/main_chat.dart';
import '../notification/notification_screen.dart';
import 'components/edit_profile.dart';
import 'components/privacy_policy.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Column(children: [
          ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                  height: 160.h,
                  // padding: EdgeInsets.symmetric(vertical: 50.h),
                  decoration: BoxDecoration(
                      color: Color(0xff29604E),
                      image: DecorationImage(
                          image: AssetImage(AppImages.appbardesign),
                          fit: BoxFit.cover)),
                  child: SafeArea(
                    child: Column(children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset(AppIcons.drawericon),
                        SizedBox(
                          width: 20.w,
                        ),
                        InterCustomText(
                          text: 'Profile',
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
                      ]),
                    ]),
                  )))
        ]),
        SizedBox(
          height: 17.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 35.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.profile,
                    height: 76.h,
                    width: 76.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  LexendCustomText(
                    text: 'John Doe',
                    fontWeight: FontWeight.w400,
                    fontsize: 20.sp,
                    textColor: Color(0xff263238),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        CustomRoute.navigateTo(context, EditProfile());
                      },
                      child: SvgPicture.asset(AppIcons.editIcon))
                ],
              ),
              SizedBox(
                height: 36.h,
              ),
              Divider(
                color: Color(0xffDADADA),
                thickness: 1.5,
              ),
              SizedBox(
                height: 5.h,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            LexendCustomText(
                              text: '10',
                              fontWeight: FontWeight.w400,
                              fontsize: 20.sp,
                              textColor: Color(0xff263238),
                            ),
                            LexendCustomText(
                              text: 'Listed',
                              fontWeight: FontWeight.w400,
                              fontsize: 10.sp,
                              textColor: Color(0xff898989),
                            ),
                          ],
                        ),
                        Container(
                          height: 24.h,
                          width: 2.w,
                          color: Color(0xffE0E0E0),
                        ),
                        Column(
                          children: [
                            LexendCustomText(
                              text: '20',
                              fontWeight: FontWeight.w400,
                              fontsize: 20.sp,
                              textColor: Color(0xff263238),
                            ),
                            LexendCustomText(
                              text: 'Sales',
                              fontWeight: FontWeight.w400,
                              fontsize: 10.sp,
                              textColor: Color(0xff898989),
                            ),
                          ],
                        ),
                        Container(
                          height: 24.h,
                          width: 2.w,
                          color: Color(0xffE0E0E0),
                        ),
                        Column(
                          children: [
                            LexendCustomText(
                              text: '2',
                              fontWeight: FontWeight.w400,
                              fontsize: 20.sp,
                              textColor: Color(0xff263238),
                            ),
                            LexendCustomText(
                              text: 'Purchases',
                              fontWeight: FontWeight.w400,
                              fontsize: 10.sp,
                              textColor: Color(0xff898989),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 69.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileWidget(
                onTap: () {
                  CustomRoute.navigateTo(context, EditProfile());
                },
                title: 'Edit Profile',
                imgUrl: AppIcons.editprofileIcon,
              ),
              SizedBox(
                height: 9.h,
              ),
              ProfileWidget(
                onTap: () {
                  CustomRoute.navigateTo(context, PrivacyPolicy());
                },
                title: 'Privacy Policy',
                imgUrl: AppIcons.privacyIcon,
              ),
              SizedBox(
                height: 9.h,
              ),
              ProfileWidget(
                onTap: () {},
                title: 'Settings',
                imgUrl: AppIcons.settingIcon,
              ),
              SizedBox(
                height: 9.h,
              ),
              ProfileWidget(
                onTap: () {
                  CustomRoute.navigateTo(context, TermCond());
                },
                title: 'Terms and Conditions',
                imgUrl: AppIcons.termcondIcon,
              ),
              SizedBox(
                height: 28.11.h,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 290.h,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: 48.w,
                                height: 5.h,
                                decoration:
                                    BoxDecoration(color: Color(0xffCDCFD0)),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              LexendCustomText(
                                text: 'Logout Account?',
                                textColor: Color(0xff090A0A),
                                fontWeight: FontWeight.w700,
                                fontsize: 24.sp,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              LexendCustomText(
                                text:
                                    'Are you sure want to logout this account?',
                                textColor: Color(0xff090A0A),
                                fontWeight: FontWeight.w400,
                                fontsize: 16.sp,
                              ),
                              SizedBox(
                                height: 37.h,
                              ),
                              CustomButton(
                                  text: 'Logout',
                                  onPressed: () {
                                    CustomRoute.navigateTo(context, LoginView());
                                  },
                                  backgroundColor: Color(0xffE60000),
                                  textColor: whiteColor),
                              SizedBox(
                                height: 22.h,
                              ),
                              LexendCustomText(
                                text: 'Cancel',
                                textColor: Color(0xff202325),
                                fontWeight: FontWeight.w500,
                                fontsize: 16.sp,
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.logoutIcon),
                    Padding(
                      padding: EdgeInsets.only(left: 26.sp),
                      child: WorkSansCustomText(
                        textColor: Color(0xff040415),
                        fontWeight: FontWeight.w700,
                        fontsize: 16.sp,
                        text: 'Log Out',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 28.11.h,
        ),
      ],
    )));
  }
}
