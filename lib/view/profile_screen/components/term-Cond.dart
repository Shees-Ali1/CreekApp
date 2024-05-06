import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../const/assets/image_assets.dart';
import '../../../const/assets/svg_assets.dart';
import '../../../widgets/custom_text.dart';

class TermCond extends StatelessWidget {
  const TermCond({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                              SvgPicture.asset(AppIcons.drawericon),
                              SizedBox(
                                width: 20.w,
                              ),
                              CustomText(
                                text: 'Terms and Conditions',
                                textColor: Colors.white,
                                fontsize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              Spacer(),
                              SvgPicture.asset(AppIcons.chaticon),
                              SizedBox(
                                width: 10.w,
                              ),
                              SvgPicture.asset(AppIcons.notificationIcon),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 35.h),
                child: CustomTextFour(
                  text:
                  'Lorem ipsum dolor sit amet Consectetur adipiscing elit. Natoque phasellus lobortis mattis cursus faucibus hac proin risus. Turpis phasellus massa ullamcorper volutpat. Ornare commodo non integer fermentum nisi, morbi id. Vel tortor mauris feugiat amet, maecenas facilisis risus, in faucibus. Vestibulum ullamcorper fames eget enim diam fames faucibus duis ac. Aliquam non tellus semper in dignissim nascetur venenatis lacus. Lectus vel non varius interdum vel tellus sed mattis. Sit laoreet auctor arcu mauris tincidunt sociis tristique pharetra neque. Aliquam pharetra elementum nisl sapien. Erat nisl morbi eu dolor in. Sapien ut lacus dui libero morbi tristique. Sit praesent mi, dolor, magna in pellentesque sollicitudin odio sed. Sit nibh aliquam enim ipsum lectus sem fermentum congue velit. Purus habitant odio in morbi aliquet velit pulvinar. Facilisis ut amet interdum pretium. Fames pretium eget orci facilisis mattis est libero facilisis ullamcorper. Est auctor amet egestas risus libero et. Auctor faucibus sit id fringilla vitae. Ac volutpat sodales tristique ut netus turpis. Lorem ipsum dolor sit amet, consectetur',
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontsize: 15.sp,
                ),
              ),
            ]))
    );
  }
}
