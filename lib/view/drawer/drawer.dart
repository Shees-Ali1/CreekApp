import 'package:creekapp/Auth/login_view.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/controller/login_auth_controller.dart';
import 'package:creekapp/view/profile_screen/components/edit_profile.dart';
import 'package:creekapp/view/profile_screen/components/privacy_policy.dart';
import 'package:creekapp/view/profile_screen/components/term-Cond.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/user_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    final LoginAuthController loginAuthController =
        Get.find<LoginAuthController>();
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 28.w,
                ),
                Obx(() {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              userController.userImage.value,
                            ),
                            fit: BoxFit.cover)),
                    height: 76.h,
                    width: 76.w,
                  );
                }),
                SizedBox(
                  width: 25.w,
                ),
                SizedBox(
                  width: 160.w,
                  child: Obx(() {
                    return LexendCustomText(
                      text: userController.userName.value,
                      fontWeight: FontWeight.w400,
                      fontsize: 20.sp,
                      textColor: blackTitleColor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    );
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            DrawerItemsWidget(
              text: 'Edit Profile',
              image: AppIcons.profileIcon,
              onTap: () {
                CustomRoute.navigateTo(context, const EditProfile());
              },
            ),
            DrawerItemsWidget(
              text: 'Privacy Policy',
              image: AppIcons.privacy,
              onTap: () {
                CustomRoute.navigateTo(context, const PrivacyPolicy());
              },
            ),
            DrawerItemsWidget(
              text: 'Term of Use',
              image: AppIcons.terms,
              onTap: () {
                CustomRoute.navigateTo(context, const TermCond());
              },
            ),
            const DrawerItemsWidget(
              text: 'Change Password',
              image: AppIcons.password,
            ),
            const DrawerItemsWidget(
              text: 'Customer Support',
              image: AppIcons.customercare,
            ),
            const DrawerItemsWidget(
              text: 'Delete Account',
              image: AppIcons.deleteaccount,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    await loginAuthController.logOut();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.logout),
                      SizedBox(
                        width: 15.w,
                      ),
                      WorkSansCustomText(
                        textColor: const Color(0xff040415),
                        fontWeight: FontWeight.w700,
                        fontsize: 16.sp,
                        text: 'Log Out',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DrawerItemsWidget extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onTap;

  const DrawerItemsWidget(
      {super.key, required this.text, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 17.h),
        child: Row(
          children: [
            SizedBox(
              height: 36.7.h,
              width: 36.7.w,
              child: SvgPicture.asset(image),
            ),
            SizedBox(
              width: 31.09.w,
            ),
            WorkSansCustomText(
              textColor: const Color(0xff040415),
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
