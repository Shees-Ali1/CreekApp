import 'package:creekapp/widgets/custom%20_backbutton.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/assets/image_assets.dart';
import '../../const/assets/svg_assets.dart';
import '../../widgets/custom_text.dart';
import 'chat_screen.dart';

class MainChat extends StatefulWidget {
  const MainChat({super.key});

  @override
  State<MainChat> createState() => _MainChatState();
}

class _MainChatState extends State<MainChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
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
                   CustomBackButton(),
                    SizedBox(
                      width: 20.w,
                    ),
                    CustomText(
                      text: 'Book Chats',
                      textColor: Colors.white,
                      fontsize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ])
                ])))),
        SizedBox(
          height: 57.h,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context,index) {
            return ListTile(
              onTap: () {
                CustomRoute.navigateTo(context, ChatScreen());
              },

              leading: Image.asset(
                AppImages.profile,
                height: 62.h,
                width: 62.w,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextThree(
                    text: 'Memory',
                    textColor: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontsize: 16.sp,
                  ),
                  CustomTextThree(
                    text: '04:43',
                    textColor: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontsize: 12.sp,
                  ),
                ],
              ),
              subtitle: CustomTextThree(
                text: 'Hey There what\'s up is everything a...',
                textColor: Colors.black,
                fontWeight: FontWeight.w400,
                fontsize: 12.sp,
              ),
            );
          }
        )
      ])
    ])));
  }
}
