import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyDialogBox extends StatelessWidget {
  const BuyDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      // height: 335.h,
        width: 404.w,
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 159.h,
              width: 163.w,
              child: Image.asset(AppImages.doneTick),
            ),
            WorkSansCustomText(text: "Book Purchased!", textColor: Color(0xff29604E), fontWeight: FontWeight.w700,fontsize: 22.sp,),
            SizedBox(height: 15.h,),
            WorkSansCustomText(text: "You bought this book from Sue S. You can now chat with Sue S about delivering the book at school.", textColor: Color(0xff010101), fontWeight: FontWeight.w400,fontsize: 14.sp,),
            SizedBox(height: 14.h,),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                    height: 54.h,
                    width: 154.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff29604E),
                        borderRadius: BorderRadius.circular(20.r)
                    ),
                    child:
                    PoppinsCustomText(text: "Home", textColor: Color(0xffFEFEFE), fontWeight: FontWeight.w600,fontsize: 16.sp,)
                ),

                SizedBox(width: 15.w,),
                SizedBox(
                  height: 54.h,
                  width: 61.w,
                  child: SvgPicture.asset(AppIcons.msgIcon),
                ),
              ],
            ),


          ],
        )

    );
  }
}
