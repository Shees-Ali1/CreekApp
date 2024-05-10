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
    final ChatController chatController=Get.find<ChatController>();
    return  StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chatMessages').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else if(snapshot.hasError){
            return Text("Snapshot Error");
          }
          else if(snapshot.data!.docs.isEmpty){
            return Text("NO Data");
          }
          else{
            dynamic chats=snapshot.data!.docs;
            return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: chats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final chatsList=chats[index];
                  final bookImage=chatsList['bookImage'];
                  final bookName=chatsList['bookName'];
                  final buyerId=chatsList['buyerId'];
                  final chatId=chatsList['chatId'];
                  return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('chatMessages').doc(chatId).collection('messages').orderBy('timeStamp',descending: true).snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        }
                        else if(snapshot.hasError){
                          return Text("Snapshot Error");
                        }
                        else if(snapshot.data!.docs.isEmpty){
                          return SizedBox.shrink();
                        }
                        else{
                          dynamic message=snapshot.data!.docs;
                          String formattedTime = chatController.formatTimestamp(message[index]['timeStamp']);


                          return ListTile(
                            onTap: () {
                              CustomRoute.navigateTo(context, ChatScreen(messagedetail:message[index], image:bookImage, chatName: buyerId!=FirebaseAuth.instance.currentUser!.uid?bookName: "You bought ${bookName}", chatId:chatId,));
                            },
                            leading: Container(
                              alignment: Alignment.bottomRight,
                              height: 62.h,
                              width: 62.w,
                              decoration: bookImage!=''?
                              BoxDecoration(
                                  image: DecorationImage(image: NetworkImage( chatsList['bookImage'],)),
                                  shape: BoxShape.circle
                              ):
                              BoxDecoration(color: Colors.grey,shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(

                                  AppImages.onlinedot,
                                  height: 10.h,
                                  width: 10.w,
                                ),
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: LexendCustomText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text:buyerId!=FirebaseAuth.instance.currentUser!.uid?bookName: "You bought ${bookName}",
                                    textColor: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontsize: 16.sp,
                                  ),
                                ),
                                LexendCustomText(
                                  text:  formattedTime,
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontsize: 12.sp,
                                ),
                              ],
                            ),
                            subtitle: LexendCustomText(
                              text:  message[index]['message'],
                              textColor: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontsize: 12.sp,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }
                      }
                  );
                });
          }


        }
    );
  }
}
