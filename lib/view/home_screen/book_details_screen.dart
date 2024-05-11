import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/bookListing_controller.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/controller/user_controller.dart';
import 'package:creekapp/view/chat_screen/chat_screen.dart';
import 'package:creekapp/view/home_screen/components/buy_dialog_box.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom _backbutton.dart';

class BookDetailsScreen extends StatefulWidget {
  final dynamic bookDetail;
  final int index;
  final bool comingfromSellScreen;
  const BookDetailsScreen({super.key, required this.bookDetail, required this.index, required this.comingfromSellScreen});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  final BookListingController bookListingController=Get.find<BookListingController>();
  final HomeController homeController=Get.find<HomeController>();
  final UserController userController=Get.find<UserController>();

  @override
  void initState() {
    // TODO: implement initState
    // bookListingController.checkUserBookOrder(widget.bookDetail['listingId'],widget.bookDetail['sellerId']);
    bookListingController.getSellerData(widget.bookDetail['sellerId']);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 28.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 400.h,
                      width: 282.w,
                     child:  Image.network(widget.bookDetail['bookImage'],fit: BoxFit.cover,),
                    ),
                  ),
                  SafeArea(
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child:const CustomBackButton()
                    ),
                  )
                ],
              ),
             SizedBox(height: 15.h,),
             SizedBox(
                  width: 297.w,

                  child: MontserratCustomText(text: widget.bookDetail['bookName'], textColor: Colors.black, fontWeight: FontWeight.w700,fontsize: 24.sp,)),
             SizedBox(height: 5.h,),
             MontserratCustomText(text: widget.bookDetail['bookPart'], textColor: Colors.black, fontWeight: FontWeight.w600,fontsize: 18.sp,),
             SizedBox(height: 20.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 MontserratCustomText(text: 'Date Posted', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                 // MontserratCustomText(text: bookDetail['bookPosted'], textColor: lightColor, fontWeight: FontWeight.w500,fontsize: 16.sp,),
               ],
             ),
              SizedBox(height: 15.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 MontserratCustomText(text: 'Author', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                 MontserratCustomText(text: widget.bookDetail['bookAuthor'], textColor: lightColor, fontWeight: FontWeight.w500,fontsize: 16.sp,),
               ],
             ),
              SizedBox(height: 15.h,),

              MontserratCustomText(text: 'Description', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
              SizedBox(height: 6.h,),
              SizedBox(
              width:   319.w,
                  child: MontserratCustomText(text: widget.bookDetail['bookDescription'], textColor: lightColor, fontWeight: FontWeight.w500,fontsize: 16.sp,)),
              SizedBox(height: 6.h,),
              widget.bookDetail['sellerId']=='qwerty'?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MontserratCustomText(text: 'Price', textColor: Colors.black, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                  MontserratCustomText(text: "\$${widget.bookDetail['bookPrice']}", textColor: lightColor, fontWeight: FontWeight.w500,fontsize: 16.sp,),
                ],
              ) :
              const SizedBox.shrink(),
              SizedBox(height: 20.h,),
              Obx(() => userController.userPurchases.contains(widget.bookDetail['listingId'])?
              GestureDetector(
                onTap: (){
                },
                child: Center(
                  child: Container(
                    height: 58.h,
                    width: 327.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20.r)
                    ),
                    child:
                    // bookDetail['sellerId']==FirebaseAuth.instance.currentUser!.uid?
                    // LexendCustomText(text: "Cancel This Listing", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,):

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LexendCustomText(text: "Chat with seller", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,),

                        // LexendCustomText(text: "\$${bookDetail['bookPrice'].toString()}", textColor: Colors.white, fontWeight: FontWeight.w600,fontsize: 24.sp,),
                      ],
                    ),

                  ),
                ),
              ):
              GestureDetector(

                onTap: (){
                  widget.bookDetail['sellerId']!=FirebaseAuth.instance.currentUser!.uid?
                  bookListingController.buyBook(widget.bookDetail['listingId'],widget.bookDetail['sellerId'],context,widget.bookDetail['bookName']):

                  widget.comingfromSellScreen==true?
                  bookListingController.removeListingfromSell(widget.index,widget.bookDetail['listingId']):
                  homeController.removeBookListing(widget.index,widget.bookDetail['listingId']);


                },
                child: Center(
                  child: Container(
                    height: 58.h,
                    width: 327.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20.r)
                    ),
                    child: widget.bookDetail['sellerId']==FirebaseAuth.instance.currentUser!.uid?
                    LexendCustomText(text: "Cancel This Listing", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,):

                    bookListingController.isLoading.value==false?Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LexendCustomText(text: "Add to Cart ", textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 18.sp,),

                        LexendCustomText(text: "\$${widget.bookDetail['bookPrice'].toString()}", textColor: Colors.white, fontWeight: FontWeight.w600,fontsize: 24.sp,),
                      ],
                    ):CircularProgressIndicator(color: Colors.white,),

                  ),
                ),
              )

              ),
              SizedBox(height: 20.h,),



            ],
          ),
        ),
      ),
    );
  }
}
