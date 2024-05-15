import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../const/assets/image_assets.dart';
import '../../const/assets/svg_assets.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_route.dart';
import '../../widgets/custom_text.dart';
import '../chat_screen/main_chat.dart';
import '../notification/notification_screen.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Scaffold(
        appBar: CustomAppBar(
          homeController: homeController,
          text: 'Wallet',
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 17.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.only(top: 22.h, bottom: 11.h),
            width: 328.w,
            height: 143.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: const LinearGradient(
                    colors: [primaryColor, lightPrimaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Column(
              children: [
                SoraCustomText(
                  text: 'Balance',
                  textColor: whiteColor,
                  fontWeight: FontWeight.w400,
                  fontsize: 12.sp,
                ),
                SoraCustomText(
                  text: '\$14,235.34',
                  textColor: whiteColor,
                  fontWeight: FontWeight.w600,
                  fontsize: 36.sp,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.topup),
                    const SizedBox(
                      width: 10,
                    ),
                    SoraCustomText(
                      text: 'Top up',
                      textColor: whiteColor,
                      fontWeight: FontWeight.w400,
                      fontsize: 12.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 61.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SoraCustomText(
                  text: 'Latest Transactions',
                  textColor: darkColor,
                  fontWeight: FontWeight.w600,
                  fontsize: 14.sp,
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: walletListing.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        horizontalTitleGap: 8,
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(
                          walletListing[index]['walletImage'].toString(),
                          height: 40.h,
                          width: 40.w,
                        ),
                        title: SoraCustomText(
                          text: walletListing[index]['walletname'],
                          textColor: darkColor,
                          fontWeight: FontWeight.w600,
                          fontsize: 12.sp,
                        ),
                        subtitle: SoraCustomText(
                          text: walletListing[index]['Timestamp'],
                          textColor: lightDarkColor,
                          fontWeight: FontWeight.w400,
                          fontsize: 12.sp,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SoraCustomText(
                              text: "\$${walletListing[index]['walletprice']}",
                              textColor: redColor,
                              fontWeight: FontWeight.w400,
                              fontsize: 12.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset(AppIcons.arrowIcon)
                          ],
                        ),
                      );
                    })
              ],
            ),
          )
        ])));
  }
}

List<dynamic> walletListing = [
  {
    'walletImage': AppImages.notification,
    'walletname': 'Walmart',
    'walletprice': 45.32,
    'Timestamp': 'yesterday 12:52'
  },
  {
    'walletImage': AppImages.download,
    'walletname': 'Top up',
    'walletprice': 35.32,
    'Timestamp': 'Today 01:52'
  }
];
