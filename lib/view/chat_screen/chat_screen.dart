import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/order_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/assets/image_assets.dart';
import '../../controller/chat_controller.dart';
import '../../widgets/custom _backbutton.dart';
import '../../widgets/custom_text.dart';
import 'components/chat_message_container.dart';

class ChatScreen extends StatefulWidget {
  // final dynamic messagedetail;
  final String image;
  final String chatName;
  final String chatId;
  final String sellerId;
  final String buyerId;
  final String seller;
  final String bookId;
  final String bookName;

  const ChatScreen(
      {super.key,
      // required this.messagedetail,
      required this.image,
      required this.chatName,
      required this.chatId,
      required this.sellerId,
      required this.buyerId,
      required this.seller,
      required this.bookId,
      required this.bookName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController chatController = Get.find<ChatController>();
  final TextEditingController messageController = TextEditingController();
  final OrderController orderController = Get.find<OrderController>();
  @override
  void initState() {
    // TODO: implement initState
    // Chat id is our order Id
    orderController.checkOrderStatus(widget.chatId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
              height: 160.h,
              // padding: EdgeInsets.symmetric(vertical: 50.h),
              decoration: const BoxDecoration(
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
                  const CustomBackButton(),
                  SizedBox(
                    width: 20.w,
                  ),
                  widget.image != ''
                      ? Container(
                          height: 53.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.image,
                                ),
                              )),
                        )
                      : CircleAvatar(),
                  SizedBox(
                    width: 8.w,
                  ),
                  SizedBox(
                    width: 210.w,
                    child: InterCustomText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: widget.chatName,
                      textColor: Colors.white,
                      fontsize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ])
              ])))),
      Expanded(
          child: Stack(
        children: [
          ChatMessageContainer(
            image: widget.image,
            chatId: widget.chatId,
          ),
          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w),
              child: ElevatedButton(
                  onPressed: () {
                    orderController.orderStatus.value == false
                        ? orderController.changeOrderStatus(widget.chatId,
                            widget.sellerId, widget.bookId, widget.bookName)
                        : null;
                  },
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(350.w, 80.h),
                    minimumSize: Size(327.w, 58.h),
                    backgroundColor: primaryColor,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Obx(() {
                    return orderController.isLoading.value == false
                        ? LexendCustomText(
                            text: orderController.orderStatus.value == true
                                ? "Order Completed"
                                : widget.seller ==
                                        FirebaseAuth.instance.currentUser!.uid
                                    ? 'Click here if u delivered the order'
                                    : 'Click here if u received the order',
                            textColor: Colors.white,
                            fontWeight: FontWeight.w400,
                          )
                        : CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          );
                  })),
            ),
          )
        ],
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(29.5.r),
            ),
            width: 293.w,
            height: 52.h,
            child: Row(
              children: [
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                      hintText: 'Type your message',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          GestureDetector(
            onTap: () {
              chatController.sendmessage(
                  messageController, widget.chatId, widget.sellerId);
            },
            child: SizedBox(
                height: 53.h, width: 53.w, child: Image.asset(AppImages.send)),
          )
        ],
      ),
      SizedBox(
        height: 19.h,
      ),
    ]));
  }
}
