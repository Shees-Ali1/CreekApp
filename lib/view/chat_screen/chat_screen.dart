import 'package:creekapp/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/assets/image_assets.dart';
import '../../controller/chat_controller.dart';
import '../../widgets/custom _backbutton.dart';
import '../../widgets/custom_text.dart';
import 'components/chat_message_container.dart';

class ChatScreen extends StatelessWidget {
  // final dynamic messagedetail;
  final String image;
  final String chatName;
  final String chatId;
  final String sellerId;
  const ChatScreen(
      {super.key,
      // required this.messagedetail,
      required this.image,
      required this.chatName,
      required this.chatId,
      required this.sellerId});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();
    final TextEditingController messageController = TextEditingController();
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
                  image != ''
                      ? Container(
                          height: 53.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  image,
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
                      text: chatName,
                      textColor: Colors.white,
                      fontsize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ])
              ])))),
      Expanded(
          child: ChatMessageContainer(
        chatId: chatId,
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
              chatController.sendmessage(messageController, chatId, sellerId);
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
