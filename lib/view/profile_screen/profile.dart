import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/assets/image_assets.dart';
import '../../const/assets/svg_assets.dart';

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
            child: Column(children: [
      ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
              // height: 200.h,
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
                ])
              ]))))
    ])));
  }
}
