import 'package:creekapp/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/assets/image_assets.dart';
import '../../const/assets/svg_assets.dart';
import '../../widgets/custom_route.dart';
import '../../widgets/custom_text.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        text: 'Wallet',
                        textColor: Colors.white,
                        fontsize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            // CustomRoute.navigateTo(context, MainChat());
                          },
                          child: SvgPicture.asset(AppIcons.chaticon)),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            // CustomRoute.navigateTo(context, NotificationScreen());
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
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.only(top: 22.h, bottom: 11.h),
        width: 328.w,
        height: 143.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: LinearGradient(
                colors: [primaryColor, Color(0xff447867)],
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
                SizedBox(
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
              textColor: Color(0xff191919),
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
                      text:walletListing[index]['walletname'] ,
                      textColor: Color(0xff191919),
                      fontWeight: FontWeight.w600,
                      fontsize: 12.sp,
                    ),
                    subtitle: SoraCustomText(
                      text: walletListing[index]['Timestamp'] ,
                      textColor: Color(0xff78838D),
                      fontWeight: FontWeight.w400,
                      fontsize: 12.sp,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SoraCustomText(
                          text: "\$${walletListing[index]['walletprice']}",
                          textColor: Color(0xffB83232),
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
List<dynamic> walletListing=[
{
  'walletImage':AppImages.notification,
  'walletname':'Walmart',
  'walletprice':45.32,
  'Timestamp':'yesterday 12:52'

},
  {
    'walletImage':AppImages.download,
    'walletname':'Top up',
    'walletprice':35.32,
    'Timestamp':'Today 01:52'

  }
];
