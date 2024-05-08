import 'package:creekapp/Auth/login_view.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../const/assets/image_assets.dart';
import '../../controller/on_boarding_controller.dart';
import '../../widgets/custom_text.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final OnBoardingController boardingVM = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: boardingVM.pageController,
        children: const <Widget>[
          OnBoardingOne(),
          OnBoardingTwo(),
          OnBoardingThree(),
        ],
      ),
    );
  }
}

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController boardingVM = Get.find<OnBoardingController>();
    return Column(
      children: [
        Container(
          height: 483.h,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.bgbackground,
                  ),
                  fit: BoxFit.fill)),
          child: SizedBox(
            width: 160.w,
            height: 220.h,
            child: Image.asset(
              AppImages.whitecreek,
            ),
          ),
        ),
        SizedBox(height: 30.h,),
        LexendCustomText(
          textColor: const Color(0xff273958),
          fontsize: 20.sp,
          text: 'Buy and sell used school items ',
          fontWeight: FontWeight.w400,
        ),
        LexendCustomText(
          text: 'Effortlessly!',
          fontWeight: FontWeight.w400,
          fontsize: 26.sp,
          textColor: const Color(0xff273958),
        ),
        SizedBox(
          height: 24.h,
        ),
        LexendCustomText(
          textColor: const Color(0xff3A3838),
          fontsize: 16.sp,
          text: 'Secure transactions with\nCreek\'sintegrated wallet!',
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 40.h,
        ),
        SmoothPageIndicator(
          controller: boardingVM.pageController,
          count: 3, // Specify the total number of pages
          effect: const ExpandingDotsEffect(
              dotHeight: 12,
              radius: 40,
              spacing: 10,
              dotWidth: 15,
              activeDotColor: primaryColor,
              expansionFactor: 2,
              dotColor: primaryColor),
        ),
        SizedBox(
          height: 29.h,
        ),
        GestureDetector(
          onTap: () => boardingVM.nextPage(),
          child: Container(
              width: 127.w,
              height: 48.h,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(40.r)),
              child: Center(
                child: LexendCustomText(
                  textColor: whiteColor,
                  fontsize: 16.sp,
                  text: 'Next',
                  fontWeight: FontWeight.w500,
                ),
              )),
        )
      ],
    );
  }
}

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController boardingVM = Get.find<OnBoardingController>();
    return Column(
      children: [
        Container(
          height: 483.h,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.bgbackground,
                  ),
                  fit: BoxFit.fill)),
          child: SizedBox(
            width: 160.w,
            height: 220.h,
            child: Image.asset(
              AppImages.whitecreek,
            ),
          ),
        ),
        SizedBox(height: 30.h,),
        LexendCustomText(
          textColor: const Color(0xff273958),
          fontsize: 20.sp,
          text: 'Browse items tailored to your\nschool community!',
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 24.h,
        ),
        LexendCustomText(
          textAlign: TextAlign.center,
          textColor: const Color(0xff3A3838),
          fontsize: 16.sp,
          text: 'Connect with sellers through\nin-app messaging!',
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 40.h,
        ),
        SmoothPageIndicator(
          controller: boardingVM.pageController,
          count: 3, // Specify the total number of pages
          effect: const ExpandingDotsEffect(
              dotHeight: 12,
              radius: 40,
              spacing: 10,
              dotWidth: 15,
              activeDotColor: primaryColor,
              expansionFactor: 2,
              dotColor: primaryColor),
        ),
        SizedBox(
          height: 29.h,
        ),
        GestureDetector(
          onTap: () => boardingVM.nextPage(),
          child: Container(
              width: 127.w,
              height: 48.h,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(40.r)),
              child: Center(
                child: LexendCustomText(
                  textColor: whiteColor,
                  fontsize: 16.sp,
                  text: 'Next',
                  fontWeight: FontWeight.w500,
                ),
              )),
        )
      ],
    );
  }
}

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController boardingVM = Get.find<OnBoardingController>();
    return Column(
      children: [
        Container(
          height: 483.h,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.bgbackground,
                  ),
                  fit: BoxFit.fill)),
          child: SizedBox(
            width: 160.w,
            height: 220.h,
            child: Image.asset(
              AppImages.whitecreek,
            ),
          ),
        ),
        SizedBox(height: 30.h,),
        LexendCustomText(
          textAlign: TextAlign.center,
          textColor: const Color(0xff273958),
          fontsize: 20.sp,
          text: 'Modern design for a seamless\nuser experience!',
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 24.h,
        ),
        LexendCustomText(
          textAlign: TextAlign.center,
          textColor: const Color(0xff3A3838),
          fontsize: 16.sp,
          text: 'Approval system ensures\nquality listings!',
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 40.h,
        ),
        SmoothPageIndicator(
          controller: boardingVM.pageController,
          count: 3, // Specify the total number of pages
          effect: const ExpandingDotsEffect(
              dotHeight: 12,
              radius: 40,
              spacing: 10,
              dotWidth: 15,
              activeDotColor: primaryColor,
              expansionFactor: 2,
              dotColor: primaryColor),
        ),
        SizedBox(
          height: 29.h,
        ),
        GestureDetector(
          onTap: () {
            CustomRoute.navigateTo(context, const LoginView());
          },
          child: Container(
              width: 127.w,
              height: 48.h,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(40.r)),
              child: Center(
                child: LexendCustomText(
                  textColor: whiteColor,
                  fontsize: 16.sp,
                  text: 'Get Started',
                  fontWeight: FontWeight.w500,
                ),
              )),
        )
      ],
    );
  }
}
