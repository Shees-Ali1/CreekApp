import 'package:creekapp/widgets/custom%20_backbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/assets/image_assets.dart';
import '../../const/assets/svg_assets.dart';
import '../../const/color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  CustomBackButton(),
                  SizedBox(
                    width: 20.w,
                  ),
                  InterCustomText(
                    text: 'Notifications',
                    textColor: Colors.white,
                    fontsize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ])
              ])))),
      SizedBox(
        height: 57.h,
      ),
      Padding(
        padding: EdgeInsets.only(left: 23.5.w),
        child: SoraCustomText(
          text: 'Latest',
          textColor: Colors.black,
          fontWeight: FontWeight.w600,
          fontsize: 14.sp,
        ),
      ),
      ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: notificationListing.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.only(left: 23.5, right: 24.w),
              horizontalTitleGap: 8,
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        height: 241.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              width: 30.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(4.r)),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Center(
                                child: WorkSansCustomText(
                              text:
                                  'Mike has marked this sale as complete,\n     did you finish this transaction?”',
                              textColor: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontsize: 16.sp,
                            )),
                            SizedBox(
                              height: 14.h,
                            ),
                            CustomButton(
                                text: 'Yes',
                                onPressed: () {},
                                backgroundColor: primaryColor,
                                textColor: whiteColor),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomButton(
                                text: 'No, I have not recieved.',
                                onPressed: () {},
                                backgroundColor: primaryColor.withOpacity(0.2),
                                textColor: whiteColor),
                          ],
                        ),
                      );
                    });
              },
              leading: Image.asset(
                notificationListing[index]['notificationImage'].toString(),
                height: 32.h,
                width: 32.w,
              ),
              title: LexendCustomText(
                text: notificationListing[index]['notificationname'],
                textColor: Colors.black,
                fontWeight: FontWeight.w600,
                fontsize: 12.sp,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LexendCustomText(
                    text: notificationListing[index]['Timestamp'],
                    textColor: Color(0xff78838D),
                    fontWeight: FontWeight.w400,
                    fontsize: 12.sp,
                  ),
                  Spacer(),
                  LexendCustomText(
                    text: "\$${notificationListing[index]['notificationincr']}",
                    textColor: Color(0xff78838D),
                    fontWeight: FontWeight.w400,
                    fontsize: 12.sp,
                  ),
                  SizedBox(width: 4.w),
                  SvgPicture.asset(AppIcons.arrowIcon)
                ],
              ),
            );
          })
    ])));
  }
}

List<dynamic> notificationListing = [
  {
    'notificationImage': AppImages.notification,
    'notificationname': 'You successfully purchased Memory',
    'Timestamp': 'yesterday 12:52',
    'notificationincr': '',
  },
  {
    'notificationImage': AppImages.download,
    'notificationname': 'Mike has marked Memory as delivered',
    'notificationincr': 100.00,
    'Timestamp': 'Today 01:52'
  },
  {
    'notificationImage': AppImages.notification,
    'notificationname': 'You successfully purchased Memory',
    'Timestamp': 'yesterday 12:52',
    'notificationincr': 430.00,
  },
];
