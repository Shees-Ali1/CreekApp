import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/controller/wallet_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../const/assets/image_assets.dart';
import '../../const/assets/svg_assets.dart';
import '../../controller/sign_up_controller.dart';
import '../../helper/stripe_payment.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_route.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';
import '../chat_screen/main_chat.dart';
import '../notification/notification_screen.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final HomeController homeController = Get.find<HomeController>();
  final WalletController walletController = Get.find<WalletController>();
  final StripePaymentMethod stripePaymentMethod = StripePaymentMethod();
  final TextEditingController amountcontroller = TextEditingController();
  final SignUpController signUpController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    walletController.fetchuserwallet();
    walletController.transactionfetch();
    
    amountcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          homeController: homeController,
          text: 'Wallet',
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 17.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.only(top: 22.h, bottom: 11.h),
            width: 328.w,
            height: 143.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: const LinearGradient(
                    colors: [primaryColor, lightPrimaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Column(
              children: [
                SoraCustomText(
                  text: 'Balance',
                  textColor: whiteColor,
                  fontWeight: FontWeight.w400,
                  fontsize: 12.sp,
                ),
                Obx(() {
                  return SoraCustomText(
                    text:
                        "\$${walletController.walletbalance.value.toString()}",
                    textColor: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontsize: 36.sp,
                  );
                }),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.topup),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      width: 30.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(4.r)),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    LexendCustomText(
                                      text: 'Enter Topup Amount',
                                      fontWeight: FontWeight.w500,
                                      fontsize: 16.sp,
                                      textColor: const Color(0xff1E1E1E),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    InputField(
                                      controller: amountcontroller,
                                      hint: 'Enter Amount',
                                      keyboard: TextInputType.number,
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black54),
                                    ),
                                    SizedBox(
                                      height: 18.h,
                                    ),
                                    CustomButton(
                                        text: 'Next',
                                        onPressed: () {

                                          signUpController.isLoading.value==false?
                                          stripePaymentMethod
                                              .payment(amountcontroller.text):null;
                                        },
                                        backgroundColor: primaryColor,
                                        textColor: whiteColor),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: SoraCustomText(
                        text: 'Top up',
                        textColor: whiteColor,
                        fontWeight: FontWeight.w400,
                        fontsize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 61.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SoraCustomText(
                  text: 'Latest Transactions',
                  textColor: darkColor,
                  fontWeight: FontWeight.w600,
                  fontsize: 14.sp,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: walletController.transaction.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String time = walletController.formattransactionTime(
                            walletController.transaction[index]
                                ['purchaseDate']);

                        return ListTile(
                          horizontalTitleGap: 8,
                          contentPadding: EdgeInsets.zero,
                          leading:
                          walletController.transaction[index]
                          ['purchaseType'] !=
                              'topup'?
                          Image.asset(
                            AppImages.walmart,
                            height: 40.h,
                            width: 40.w,
                          ):Image.asset(
                            AppImages.download,
                            height: 40.h,
                            width: 40.w,
                          ),
                          title: SoraCustomText(
                            text: walletController.transaction[index]
                                ['purchaseName'],
                            textColor: darkColor,
                            fontWeight: FontWeight.w600,
                            fontsize: 12.sp,
                          ),
                          subtitle: SoraCustomText(
                            text: time,
                            textColor: lightDarkColor,
                            fontWeight: FontWeight.w400,
                            fontsize: 12.sp,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              walletController.transaction[index]
                                          ['purchaseType'] !=
                                      'topup'
                                  ? SoraCustomText(
                                      text:
                                          "-\$${walletController.transaction[index]['purchasePrice']}",
                                      textColor: redColor,
                                      fontWeight: FontWeight.w400,
                                      fontsize: 12.sp,
                                    )
                                  : SoraCustomText(
                                      text:
                                          "+\$${walletController.transaction[index]['purchasePrice']}",
                                      textColor: Color(0xff289B4F),
                                      fontWeight: FontWeight.w400,
                                      fontsize: 12.sp,
                                    ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SvgPicture.asset(AppIcons.arrowIcon)
                            ],
                          ),
                        );
                      });
                })
              ],
            ),
          ),
                  SizedBox(height: 20.h,)
        ])));
  }
}

List<dynamic> walletListing = [
  {
    'walletImage': AppImages.notification,
    'walletname': 'Walmart',
    'walletprice': 45.32,
    'Timestamp': 'yesterday 12:52'
  },
  {
    'walletImage': AppImages.download,
    'walletname': 'Top up',
    'walletprice': 35.32,
    'Timestamp': 'Today 01:52'
  }
];
