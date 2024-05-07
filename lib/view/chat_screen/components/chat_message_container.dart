import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/assets/image_assets.dart';
import '../../../const/color.dart';
import '../../../controller/chat_controller.dart';
import '../main_chat.dart';

class ChatMessageContainer extends StatelessWidget {
  final dynamic messagedetail;

  const ChatMessageContainer({
    super.key,
    required this.messagedetail,
  });

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find();
    final width = MediaQuery.of(context).size.width;

    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.vertical,
        itemCount: chatController.messages.length,
        itemBuilder: (context, index) {
          final role = chatController.messages[index]['sendby'];

          return Container(
            alignment:
                role == 'me' ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                  mainAxisAlignment: role == 'me'
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        role == 'me'
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.only(
                                  top: 10.sp,
                                ),
                                child: Image.asset(
                                  messagedetail['messageImage'],
                                  height: 26.h,
                                  width: 31.w,
                                ),
                              ),
                        Container(
                          margin: role == 'me'
                              ? EdgeInsets.symmetric(horizontal: 14.sp)
                              : EdgeInsets.only(left: 5.sp),
                          padding: EdgeInsets.symmetric(
                              horizontal: 17.w, vertical: 4.h),
                          constraints: BoxConstraints(
                            maxWidth: width / 1.3,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: role == 'me'
                                  ? primaryColor
                                  : primaryColor.withOpacity(0.08)),
                          child: SelectableText(
                              chatController.messages[index]['message']!,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color:
                                      role == 'me' ? whiteColor : Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        },
      );
    });
  }
}
