import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/view/sell_screens/list_sell_book_screen.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BooksFilterBottomSheet extends StatelessWidget {
  const BooksFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final TextEditingController authorController = TextEditingController();
    final TextEditingController teacherController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4.h,
                width: 50.w,
                decoration: BoxDecoration(
                  // color: AppColor.green,
                  color: greenColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                "Filter",
                style: GoogleFonts.lato(
                  // color: AppColor.green,

                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: primaryColor),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  homeController.priceSliderValue.value = 50;
                  homeController.selectedCondition.value = 0;
                  homeController.sliderValue.value = 50;
                  authorController.clear();
                  teacherController.clear();
                  homeController.classOption.value = 'Class 10';
                  homeController.filteredBooks.value = homeController.bookListing;
                  homeController.update();
                  Get.back();
                },
                child: Container(
                  width: 68.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    // color: AppColor.green,
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Center(
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          LatoCustomText(
            text: 'Class',
            textColor: primaryColor,
            fontWeight: FontWeight.w700,
            fontsize: 18.sp,
          ),
          SizedBox(height: 10.h),
          Obx(() {
            return Container(
              height: 50.h,
              width: 327.w,

              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w),

              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20.r)
              ),
              child: DropdownButton<String>(
                  underline: const SizedBox.shrink(),
                  isExpanded: true,
                  value: homeController.classOption.value,
                  items: homeController.bookClass.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: RalewayCustomText(text: option,
                          textColor: primaryColor,
                          fontWeight: FontWeight.w700),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // homeController.bookClass.value=newValue!;
                    homeController.classOption.value = newValue!;
                  },
                  hint: const SizedBox.shrink()
              ),
            );
          }),


          SizedBox(height: 11.h,),


          LatoCustomText(

            text: 'Condition',
            textColor: primaryColor,
            fontWeight: FontWeight.w700,
            fontsize: 18.sp,
          ),
          SizedBox(height: 11.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() {
                return ConditionContainer(
                  condtionText: 'All',
                  onTap: () {
                    homeController.selectedCondition.value = 1;
                  },
                  color: homeController.selectedCondition.value == 1
                      ? primaryColor
                      : primaryColor.withOpacity(0.08),
                  textcolor: homeController.selectedCondition.value == 1
                      ? Colors.white : primaryColor,
                );
              }),
              Obx(() {
                return ConditionContainer(
                  condtionText: 'New',
                  onTap: () {
                    homeController.selectedCondition.value = 2;
                  },
                  color: homeController.selectedCondition.value == 2
                      ? primaryColor
                      : primaryColor.withOpacity(0.08),
                  textcolor: homeController.selectedCondition.value == 2
                      ? Colors.white : primaryColor,
                );
              }),
              Obx(() {
                return ConditionContainer(
                  condtionText: 'Like New',
                  onTap: () {
                    homeController.selectedCondition.value = 3;
                  },
                  color: homeController.selectedCondition.value == 3
                      ? primaryColor
                      : primaryColor.withOpacity(0.08),
                  textcolor: homeController.selectedCondition.value == 3
                      ? Colors.white : primaryColor,

                );
              }),
              Obx(() {
                return ConditionContainer(
                  condtionText: 'Old',
                  onTap: () {
                    homeController.selectedCondition.value = 4;
                  },
                  color: homeController.selectedCondition.value == 4
                      ? primaryColor
                      : primaryColor.withOpacity(0.08),
                  textcolor: homeController.selectedCondition.value == 4
                      ? Colors.white : primaryColor,

                );
              }),
            ],
          ),
          SizedBox(height: 20.h),
          RalewayCustomText(
            text: "Author",

            // color: AppColor.green,
            textColor: primaryColor,

            fontWeight: FontWeight.w700,
            fontsize: 18.sp,
          ),
          SizedBox(height: 5.h),
          CustomSellTextField(suffixIcon: const Icon(Icons.search),
            controller: authorController,),
          SizedBox(height: 19.h),
          RalewayCustomText(
            text: "Teacher",

            // color: AppColor.green,
            textColor: primaryColor,

            fontWeight: FontWeight.w700,
            fontsize: 18.sp,
          ),
          SizedBox(height: 5.h),
          CustomSellTextField(suffixIcon: const Icon(Icons.search),
            controller: teacherController,),
          SizedBox(height: 20.h),
          Row(
            children: [
              RalewayCustomText(
                text: "Price",

                // color: AppColor.green,
                textColor: primaryColor,

                fontWeight: FontWeight.w700,
                fontsize: 18.sp,
              ),
              const Spacer(),
              Obx(() {
                return WorkSansCustomText(
                  text: '< \$${homeController.priceSliderValue.value}',
                  textColor: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontsize: 18.sp,
                );
              })
            ],
          ),
          GetBuilder<HomeController>(
              builder: (homeController) {
                return FlutterSlider(

                  values: [homeController.sliderValue.value],
                  max: 500,
                  min: 0,
                  trackBar: const FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(color: primaryColor)),
                  handler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle),
                      child: Container(
                        height: 35.h,
                        width: 34.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primaryColor),
                            borderRadius: BorderRadius.circular(9.r)),
                        child: const Icon(Icons.compare_arrows_outlined),
                      )),
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    homeController.priceSliderValue.value = lowerValue;
                    print(homeController.priceSliderValue.value);
                  },
                );
              }),
          SizedBox(height: 26.h),
          GestureDetector(
            onTap: () {
              print("HI");
              homeController.applyFilters(authorController.text);
              Get.back();

              print(homeController.filteredBooks);
            },
            child: Center(
              child: Container(
                width: 278.w,
                height: 63.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: primaryColor,
                ),
                child: const LatoCustomText(
                    text: 'Apply Filter',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConditionContainer extends StatelessWidget {
  final String condtionText;
  final void Function()? onTap;
  final Color? color;
  final Color textcolor;

  const ConditionContainer(
      {super.key, required this.condtionText, this.onTap, this.color, required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
        EdgeInsets.only(top: 17.5.h, bottom: 17.5.h, left: 24.w, right: 24.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: color),
        child: RalewayCustomText(
          text: condtionText,
          textColor: textcolor,
          fontWeight: FontWeight.w700,
          fontsize: 10.sp,
        ),
      ),
    );
  }
}
