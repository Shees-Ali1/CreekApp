import 'package:creekapp/const/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Image.asset(
        fit: BoxFit.cover,
        AppImages.backbutton,
        width: 38.w,
        height: 38.h,
      ),
      // child: Container(
      //   margin: EdgeInsets.only(top: 5.h),
      //   width: 38.w,
      //   height: 38.h,
      //   decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: Color(0xff29604E)
      //   ),
      //   child: Icon(Icons.arrow_back,color: Colors.white,),
      // ),
    );
  }
}
