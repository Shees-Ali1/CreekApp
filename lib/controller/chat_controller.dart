import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatController extends GetxController {

  RxList<dynamic> messages = [
    {
      "sendby": 'me',
      "message": 'how are you',
    },
    {
      "sendby": 'other',
      "message": 'I am fine',
    }
  ].obs;
  Future<void> sendmessage(TextEditingController messageController,String chatId) async{
  try{
    if (messageController.text.isNotEmpty) {
      DocumentSnapshot chatSnap= await FirebaseFirestore.instance.collection('chatMessages').doc(chatId).get();
      if(chatSnap.exists){
        await FirebaseFirestore.instance.collection('chatMessages').doc(chatId).collection('messages').add({
          'message':messageController.text,
          'timeStamp':DateTime.now(),
          'userId':FirebaseAuth.instance.currentUser!.uid,
        });
        messageController.clear();
        print("MEssage sent");


      }
      else{
        print("chat id doc does not exist");
      }

    }
  }catch(e){
    print("Error sending message $e");
  }
  }

  // Convert timestamp to DateTime hour minute
  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat.Hm().format(dateTime);
    return formattedTime;
  }

}
