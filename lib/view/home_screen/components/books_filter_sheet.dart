import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:creekapp/const/color.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BooksFilterBottomSheet extends StatelessWidget {
  const BooksFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment
                .center,
            children: [
              Container(
                height: 4.h,
                width: 50.w,
                decoration: BoxDecoration(
                  // color: AppColor.green,
                  color: Color(0xff57C4B7),
                  borderRadius:
                  BorderRadius.circular(4.r),
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
                  color:primaryColor
                ),
              ),
              const Spacer(),
              GestureDetector(
                // onTap: () {
                //   houseVM.miles.value = 1;
                //   houseVM.selectedProperty.clear();
                //   houseVM.selectedLookingTo.clear();
                // },
                child: Container(
                  width: 68.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    // color: AppColor.green,
                    color: primaryColor,
                    borderRadius:
                    BorderRadius.circular(35.r),
                  ),
                  child: Center(
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight
                              .w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        LatoCustomText(text: 'Class', textColor: primaryColor, fontWeight: FontWeight.w700,fontsize: 18.sp,),

          SizedBox(height: 10.h),
          LatoCustomText(text: 'Condition', textColor: primaryColor, fontWeight: FontWeight.w700,fontsize: 18.sp,),

          SizedBox(height: 20.h),
          // Text(
          //   "Looking to",
          //   style: GoogleFonts.lato(
          //     // color: AppColor.darkBlue,
          //     fontSize: 18.sp,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(height: 10.h),
          // Obx(
          //       () =>
          //       Container(
          //         child: Wrap(
          //           runSpacing: 10.h,
          //           spacing: 9.w,
          //           children: List.generate(
          //             lookingTo.length,
          //                 (index) =>
          //                 GestureDetector(
          //                   onTap: () {
          //                     if (houseVM
          //                         .selectedLookingTo
          //                         .contains(
          //                         lookingTo[index])) {
          //                       houseVM
          //                           .selectedLookingTo
          //                           .remove(
          //                           lookingTo[index]);
          //                     } else {
          //                       houseVM
          //                           .selectedLookingTo
          //                           .add(
          //                           lookingTo[index]);
          //                     }
          //                   },
          //                   child: Container(
          //                     padding: EdgeInsets
          //                         .symmetric(
          //                         horizontal: 10.w,
          //                         vertical: 7.5.h),
          //                     height: 47.h,
          //                     constraints:
          //                     BoxConstraints(
          //                         maxWidth: 98.w),
          //                     decoration: BoxDecoration(
          //                       borderRadius:
          //                       BorderRadius.circular(
          //                           20),
          //                       color: houseVM
          //                           .selectedLookingTo
          //                           .contains(
          //                           lookingTo[index])
          //                           ? AppColor.green
          //                           : const Color(
          //                           0xFFF5F4F8),
          //                     ),
          //                     child: Center(
          //                       child: Text(
          //                         lookingTo[index],
          //                         style: GoogleFonts
          //                             .lato(
          //                           color: houseVM
          //                               .selectedLookingTo
          //                               .contains(
          //                               lookingTo[index])
          //                               ? Colors.white
          //                               : const Color(
          //                               0xFF2A5F59),
          //                           fontSize: 10.sp,
          //                           fontWeight: FontWeight
          //                               .w700,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //           ),
          //         ),
          //       ),
          // ),
          SizedBox(height: 20.h),
          RalewayCustomText(
          text:   "Author",

              // color: AppColor.green,
              textColor: primaryColor,

              fontWeight: FontWeight.w700,
              fontsize: 18.sp,

          ),
          SizedBox(height: 5.h),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: 10.sp),
            padding: EdgeInsets.symmetric(
                horizontal: 13.w, vertical: 7.5.h),
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20.r),
              color: const Color(0xffF5F4F8),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                // SvgPicture.asset(
                //     AppIcons.locationField),
                SizedBox(
                  width: 15.w,
                ),
                // Container(
                //   width: 132.w,
                //   height: 38.h,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius:
                //       BorderRadius.circular(12)),
                //   child: Stack(
                //     children: [
                //       CountryCodePicker(
                //         textOverflow: TextOverflow
                //             .ellipsis,
                //         padding: const EdgeInsets
                //             .only(right: 9),
                //         showFlag: false,
                //         onChanged: (countryCode) {
                //           // onCountryChanged(countryCode.code); // Using callback to update the country code
                //           debugPrint(countryCode
                //               .toLongString());
                //         },
                //         initialSelection: 'US',
                //         showCountryOnly: true,
                //         showOnlyCountryWhenClosed: true,
                //       ),
                //       Positioned(
                //           right: 0.w,
                //           top: 7.h,
                //           child: const Icon(
                //             Icons.arrow_drop_down,
                //             color: AppColor.green,
                //           ))
                //     ],
                //   ),
                // ),
                const Spacer(),
                // SvgPicture.asset(
                //   AppIcons.iconSearch,
                //   colorFilter: const ColorFilter.mode(
                //     AppColor.greenAccent,
                //     // Desired color
                //     BlendMode
                //         .srcIn, // Adjust blend mode as needed
                //   ),
                // ),
              ],
            ),
          ),

          SizedBox(height: 20.h),
          RalewayCustomText(
            text:   "Teacher",

            // color: AppColor.green,
            textColor: primaryColor,

            fontWeight: FontWeight.w700,
            fontsize: 18.sp,

          ),
          SizedBox(height: 5.h),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: 10.sp),
            padding: EdgeInsets.symmetric(
                horizontal: 13.w, vertical: 7.5.h),
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20.r),
              color: const Color(0xffF5F4F8),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                // SvgPicture.asset(
                //     AppIcons.locationField),
                SizedBox(
                  width: 15.w,
                ),
                // Container(
                //   width: 132.w,
                //   height: 38.h,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius:
                //       BorderRadius.circular(12)),
                //   child: Stack(
                //     children: [
                //       CountryCodePicker(
                //         textOverflow:
                //         TextOverflow.ellipsis,
                //         padding:
                //         const EdgeInsets.only(
                //             right: 9),
                //         showFlag: false,
                //         onChanged: (countryCode) {
                //           // onCountryChanged(countryCode.code); // Using callback to update the country code
                //           debugPrint(
                //               countryCode
                //                   .toLongString());
                //         },
                //         initialSelection: 'US',
                //         showCountryOnly: true,
                //         showOnlyCountryWhenClosed: true,
                //       ),
                //       Positioned(
                //           right: 0.w,
                //           top: 7.h,
                //           child: const Icon(
                //             Icons.arrow_drop_down,
                //             color: AppColor.green,
                //           ))
                //     ],
                //   ),
                // ),
                // const Spacer(),
                // SvgPicture.asset(
                //   AppIcons.iconSearch,
                //   colorFilter: const ColorFilter.mode(
                //     AppColor.greenAccent,
                //     // Desired color
                //     BlendMode
                //         .srcIn, // Adjust blend mode as needed
                //   ),
                // ),
              ],
            ),
          ),

          SizedBox(height: 20.h),
          Row(
            children: [
            RalewayCustomText(
            text:   "Price",

            // color: AppColor.green,
            textColor: primaryColor,

            fontWeight: FontWeight.w700,
            fontsize: 18.sp,


              ),

              const Spacer(),
              // Obx(
              //       () =>
              //       Text(
              //         "${houseVM.miles.value} miles",
              //         style: GoogleFonts.raleway(
              //           color: AppColor.green,
              //           fontSize: 18.sp,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              // )
            ],
          ),
          FlutterSlider(
            values: [300],
            max: 500,
            min: 0,
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
              color: primaryColor
            )
          ),
          handler: FlutterSliderHandler(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle
            ),
           child: Container(
             height: 35.h,
             width: 34.w,
             decoration: BoxDecoration(
               color: Colors.white,
               border: Border.all(color: primaryColor),
               borderRadius: BorderRadius.circular(9.r)
             ),
             child: Icon(Icons.compare_arrows_outlined),
           )
                      ),
            onDragging: (handlerIndex, lowerValue, upperValue) {

            },
          ),
          //       Slider.adaptive(
          //           min: 1,
          //           max: 30,
          //           // thumbColor: AppColor.green,
          //           // activeColor: AppColor.green,
          //            value: 20.0,
          //           onChanged: (value) {
          //
          //           }
          // ),
          SizedBox(height: 30.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment
          //       .center,
          //   children: [
          //     RoundButton(
          //       width: 270.w,
          //       height: 50.h,
          //       buttonColor: AppColor.green,
          //       textColor: Colors.white,
          //       title: "Apply Now",
          //       onTap: () {},
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
