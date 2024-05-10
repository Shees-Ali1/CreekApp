import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/const/assets/image_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/color.dart';
import '../../../controller/chat_controller.dart';

class ChatMessageContainer extends StatelessWidget {
final String chatId;
  const ChatMessageContainer({
    super.key, required this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    var currentUser=FirebaseAuth.instance.currentUser?.uid;
    final width = MediaQuery.of(context).size.width;

    return  StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chatMessages').doc(chatId).collection('messages').orderBy('timeStamp',descending: false).snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasError){
          return Text("Snapshot Error");
        }
        else if(snapshot.data!.docs.isEmpty){
          return Text("NO Data");
        }
        else{
          dynamic messages=snapshot.data!.docs;
          return ListView.builder(
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.vertical,
            itemCount: messages.length,
            itemBuilder: (context, index) {

              final role = messages[index]['userId'];

              return Container(
                alignment:
                role == currentUser? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                      mainAxisAlignment: role == currentUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            role == currentUser
                                ? const SizedBox.shrink()
                                : Padding(
                              padding: EdgeInsets.only(
                                top: 10.sp,
                              ),
                              child: Image.asset(
                                AppImages.profile1,
                                height: 26.h,
                                width: 31.w,
                              ),
                            ),
                            Container(
                              margin: role == currentUser
                                  ? EdgeInsets.symmetric(horizontal: 14.sp)
                                  : EdgeInsets.only(left: 5.sp),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 17.w, vertical: 4.h),
                              constraints: BoxConstraints(
                                maxWidth: width / 1.3,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: role == currentUser
                                      ? primaryColor
                                      : primaryColor.withOpacity(0.08)),
                              child: SelectableText(
                                  messages[index]['message']!,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color:
                                      role ==currentUser ? whiteColor : Colors.black,
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
        }

      }
    );

  }
}
