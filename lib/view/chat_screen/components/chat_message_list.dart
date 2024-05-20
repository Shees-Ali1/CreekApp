import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/controller/chat_controller.dart';
import 'package:creekapp/view/chat_screen/chat_screen.dart';
import 'package:creekapp/view/chat_screen/main_chat.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:creekapp/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('convo')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return SizedBox.shrink();
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
                child: Column(
              children: [
                SizedBox(
                  height: 180.h,
                ),
                Text(
                  "No Chats",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ));
          } else {
            return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final chat = snapshot.data!.docs[index];
                  return StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('booksListing')
                          .doc(chat['bookId'])
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox.shrink();
                        } else if (snapshot.hasError) {
                          return SizedBox.shrink();
                        } else if (snapshot.data == null) {
                          return SizedBox.shrink();
                        } else {
                          dynamic bookData = snapshot.data!.data();
                          return StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('userDetails')
                                  .doc(chat['sellerId'] ==
                                          FirebaseAuth.instance.currentUser!.uid
                                      ? chat['buyerId']
                                      : chat['sellerId'])
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SizedBox.shrink();
                                } else if (snapshot.hasError) {
                                  return SizedBox.shrink();
                                } else {
                                  dynamic userStatus = snapshot.data!.data();

                                  return StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('userMessages')
                                          .doc(chat['chatId'])
                                          .collection('messages')
                                          .orderBy('timeStamp',
                                              descending: true)
                                          .snapshots(),
                                      builder: (context, latestMsgSnapshot) {
                                        if (latestMsgSnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return SizedBox.shrink();
                                        } else if (latestMsgSnapshot.hasError) {
                                          return SizedBox.shrink();
                                        } else {
                                          dynamic latestMessage =
                                              latestMsgSnapshot.data!.docs;
                                          String formattedTime = chatController
                                              .formatTimestamp(latestMessage[0]
                                                  ['timeStamp']);

                                          return ListTile(
                                            onTap: () {
                                              CustomRoute.navigateTo(
                                                  context,
                                                  ChatScreen(
                                                    image:
                                                        chat['bookImage']??'',
                                                    chatName: chat['buyerId'] !=
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid
                                                        ? chat['bookName']
                                                        : "You Bought ${chat['bookName']}",
                                                    chatId: chat['chatId'],
                                                    sellerId: chat[
                                                                'sellerId'] ==
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid
                                                        ? chat['buyerId']
                                                        : chat['sellerId'],
                                                    buyerId: chat['buyerId'],
                                                    seller: chat['sellerId'],
                                                    bookId: chat['bookId'],
                                                    bookName: chat['bookName'],
                                                  ));
                                              //    CustomRoute.navigateTo(context, ChatScreen(receiverUserID: chat['sellerId']));
                                            },
                                            leading: Container(
                                              alignment: Alignment.bottomRight,
                                              height: 62.h,
                                              width: 62.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                    chat['bookImage']??'',
                                                  ))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: userStatus['online']
                                                    ? Image.asset(
                                                        AppImages.onlinedot,
                                                        height: 10.h,
                                                        width: 10.w,
                                                      )
                                                    : SizedBox.shrink(),
                                              ),
                                            ),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 200.w,
                                                  child: LexendCustomText(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    text: chat['sellerId'] !=
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid
                                                        ? "YOU bought ${chat['bookName']}"
                                                        : chat['bookName'],
                                                    textColor: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontsize: 16.sp,
                                                  ),
                                                ),
                                                LexendCustomText(
                                                  text: formattedTime,
                                                  textColor: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                ),
                                              ],
                                            ),
                                            subtitle: LexendCustomText(
                                              text: latestMessage[0]['message'],
                                              textColor: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontsize: 12.sp,
                                            ),
                                          );
                                        }
                                      });
                                }
                              });
                        }
                      });
                });
          }
        });
  }
}
