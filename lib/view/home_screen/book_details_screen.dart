import 'dart:ffi';

import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/bookListing_controller.dart';
import 'package:creekapp/controller/chat_controller.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/controller/user_controller.dart';
import 'package:creekapp/view/chat_screen/chat_screen.dart';
import 'package:creekapp/view/home_screen/components/buy_dialog_box.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/assets/image_assets.dart';
import '../../widgets/custom _backbutton.dart';

class BookDetailsScreen extends StatefulWidget {
  final dynamic bookDetail;
  final int index;
  final bool comingfromSellScreen;
  const BookDetailsScreen(
      {super.key,
      required this.bookDetail,
      required this.index,
      required this.comingfromSellScreen});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  final BookListingController bookListingController =
      Get.find<BookListingController>();
  final HomeController homeController = Get.find<HomeController>();
  final UserController userController = Get.find<UserController>();
  final ChatController chatController = Get.find<ChatController>();

  @override
  void initState() {
    // TODO: implement initState

    chatController.getorderId(widget.bookDetail['listingId']);
    // bookListingController.checkUserBookOrder(widget.bookDetail['listingId'],widget.bookDetail['sellerId']);
    bookListingController.getSellerData(widget.bookDetail['sellerId']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 452.h,
                    width: 282.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.bookDetail['bookImage'],
                            ))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 26.4),
                  child: SafeArea(
                    child: const CustomBackButton(),
                  ),
                ),
                Obx(
                  () => chatController.deliverystatus == false
                      ? Positioned(
                          bottom: 90.h,
                          child: Container(
                            height: 251.h,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: blackShadeColor.withOpacity(0.6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(
                                    height: 84.h,
                                    width: 87.w,
                                    child: Image.asset(
                                      AppImages.approvalPending,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 13.h,
                                ),
                                InterCustomText(
                                  text: 'Pending Delivery',
                                  textColor: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontsize: 22.sp,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                      width: 297.w,
                      child: MontserratCustomText(
                        text: widget.bookDetail['bookName'],
                        textColor: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontsize: 24.sp,
                      )),
                  SizedBox(
                    height: 5.h,
                  ),
                  MontserratCustomText(
                    text: widget.bookDetail['bookPart'],
                    textColor: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontsize: 18.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MontserratCustomText(
                        text: 'Date Posted',
                        textColor: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontsize: 16.sp,
                      ),
                      // MontserratCustomText(text: bookDetail['bookPosted'], textColor: lightColor, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MontserratCustomText(
                        text: 'Author',
                        textColor: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontsize: 16.sp,
                      ),
                      MontserratCustomText(
                        text: widget.bookDetail['bookAuthor'],
                        textColor: lightColor,
                        fontWeight: FontWeight.w500,
                        fontsize: 16.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  MontserratCustomText(
                    text: 'Description',
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontsize: 16.sp,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  SizedBox(
                      width: 319.w,
                      child: MontserratCustomText(
                        text: widget.bookDetail['bookDescription'],
                        textColor: lightColor,
                        fontWeight: FontWeight.w500,
                        fontsize: 16.sp,
                      )),
                  SizedBox(
                    height: 6.h,
                  ),
                  widget.bookDetail['sellerId'] == 'qwerty'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MontserratCustomText(
                              text: 'Price',
                              textColor: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontsize: 16.sp,
                            ),
                            MontserratCustomText(
                              text: "\$${widget.bookDetail['bookPrice']}",
                              textColor: lightColor,
                              fontWeight: FontWeight.w500,
                              fontsize: 16.sp,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(() => userController.userPurchases
                          .contains(widget.bookDetail['listingId'])
                      ? GestureDetector(
                          onTap: () {
                            CustomRoute.navigateTo(
                                context,
                                ChatScreen(
                                  image: widget.bookDetail['bookImage'],
                                  chatName: widget.bookDetail['sellerId'] ==
                                          FirebaseAuth.instance.currentUser!.uid
                                      ? widget.bookDetail['bookName']
                                      : "You Bought ${widget.bookDetail['bookName']}",
                                  chatId: chatController
                                      .orderId.value, //order is our chatId

                                  sellerId: widget.bookDetail['sellerId'] ==
                                          FirebaseAuth.instance.currentUser!.uid
                                      ? chatController.buyerId.value
                                      : chatController.sellerId.value,
                                  buyerId: chatController.buyerId.value,
                                  seller: widget.bookDetail['sellerId'],
                                  bookId: widget.bookDetail['bookImage'],
                                  bookName: widget.bookDetail['bookName'],
                                ));
                          },
                          child: Center(
                            child: Container(
                              height: 58.h,
                              width: 327.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child:
                                  // bookDetail['sellerId']==FirebaseAuth.instance.currentUser!.uid?
                                  // LexendCustomText(text: "Cancel This Listing", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,):

                                  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LexendCustomText(
                                    text: "Chat with seller",
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontsize: 18.sp,
                                  ),

                                  // LexendCustomText(text: "\$${bookDetail['bookPrice'].toString()}", textColor: Colors.white, fontWeight: FontWeight.w600,fontsize: 24.sp,),
                                ],
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                           if( userController.verified.value == true){

                            widget.bookDetail['sellerId'] !=
                                    FirebaseAuth.instance.currentUser!.uid
                                ? bookListingController.buyBook(
                                    widget.bookDetail['listingId'],
                                    widget.bookDetail['sellerId'],
                                    context,
                                    widget.bookDetail['bookName'],
                                    widget.bookDetail['bookPrice'])
                                : widget.comingfromSellScreen == true
                                    ? bookListingController
                                        .removeListingfromSell(widget.index,
                                            widget.bookDetail['listingId'])
                                    : homeController.removeBookListing(
                                        widget.index,
                                        widget.bookDetail['listingId']);}else{
                             Get.snackbar('Your Profile is UnderReview', 'Wait for Admin Approval');
                           }
                          },
                          child: Center(
                            child: Container(
                              height: 58.h,
                              width: 327.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: widget.bookDetail['sellerId'] ==
                                      FirebaseAuth.instance.currentUser!.uid
                                  ? LexendCustomText(
                                      text: "Cancel This Listing",
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontsize: 18.sp,
                                    )
                                  : bookListingController.isLoading.value ==
                                          false
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            LexendCustomText(
                                              text: "Add to Cart ",
                                              textColor: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontsize: 18.sp,
                                            ),
                                            LexendCustomText(
                                              text:
                                                  "\$${widget.bookDetail['bookPrice'].toString()}",
                                              textColor: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontsize: 24.sp,
                                            ),
                                          ],
                                        )
                                      : CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                            ),
                          ),
                        )),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
