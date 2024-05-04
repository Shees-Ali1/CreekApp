import 'package:creekapp/view/splash/splash_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/assets/image_assets.dart';
import '../../controller/on_boarding_controller.dart';

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
          // OnBoardingOne(),
          // OnBoardingTwo(),
          // OnBoardingThree(),
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
    return Container(
      child: Column(
        children: [
          Image.asset(
            AppImages.greencreekIcon,
            height: 242.h,
            width: 172.w,
          ),
          Text('Browse items tailored to your school community!'),
          Text('Connect with sellers through in-app messaging!'),

        ],
      ),
    );
  }
}

// class OnBoardingTwo extends StatelessWidget {
//   const OnBoardingTwo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     OnBoardingController boardingVM = Get.find<OnBoardingController>();
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 35.h),
//           SizedBox(height:height* 0.05,),
//           SizedBox(height: height * 0.5,
//             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   AppImages.onBoard2BG,
//                   scale: 4.5,
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             "Find Your",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 40.sp,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black),
//           ),
//           Text(
//             "Dream Job",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 40.sp,
//                 decoration: TextDecoration.underline,
//                 fontWeight: FontWeight.w700,
//                 color: AppColor.green),
//           ),
//           Text(
//             "Here!",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 40.sp,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black),
//           ),
//           const SizedBox(height: 15),
//           Text(
//             "Explore all the most exciting job roles based on your interest and study major.",
//             textAlign: TextAlign.start,
//             style: TextStyle(
//               fontSize: 14.sp,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 2),
//           Row(
//             children: [
//               Image.asset(
//                 AppImages.onBoard2Indicator,
//                 scale: 4.5,
//               ),
//               const Spacer(),
//               GestureDetector(
//                 onTap: ()=>boardingVM.nextPage(),
//                 child: Image.asset(
//                   AppImages.onBoardArrow,
//                   scale: 4.5,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnBoardingThree extends StatelessWidget {
//   const OnBoardingThree({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     OnBoardingController boardingVM = Get.find<OnBoardingController>();
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 35.h),
//           SizedBox(height:height* 0.05,),
//           SizedBox(height: height * 0.5,
//             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   AppImages.onBoard3BG,
//                   scale: 4.5,
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             "Find Your",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 40.sp,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black),
//           ),
//           Text(
//             "New Home",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 40.sp,
//                 decoration: TextDecoration.underline,
//                 fontWeight: FontWeight.w700,
//                 color: AppColor.green),
//           ),
//           Text(
//             "Here!",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 40.sp,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black),
//           ),
//           const SizedBox(height: 15),
//           Text(
//             "Find the best place to stay in a good price.",
//             textAlign: TextAlign.start,
//             style: TextStyle(
//               fontSize: 14.sp,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 15),
//           Row(mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 AppImages.onBoard3Indicator,
//                 scale: 4.5,
//               ),
//               const Spacer(),
//               GestureDetector(
//                 onTap: ()=>boardingVM.nextPage(),
//                 child: Image.asset(
//                   AppImages.onBoardArrow,
//                   scale: 4.5,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
