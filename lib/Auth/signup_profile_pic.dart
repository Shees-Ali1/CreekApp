import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/assets/image_assets.dart';

class SignupProfilePic extends StatelessWidget {
  const SignupProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.sp),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 46.h,
                      ),
                      Center(
                        child: Image.asset(
                          AppImages.greencreekIcon,
                          height: 168.h,
                          width: 130.w,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                    ]))));
  }
}
