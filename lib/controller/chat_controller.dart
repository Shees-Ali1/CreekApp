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
      DocumentSnapshot chatSnap= await FirebaseFirestore.instance.collection("userMessages").doc(chatId).get();
      // if(chatSnap.exists){
        await FirebaseFirestore.instance.collection('userMessages').doc(chatId).collection('messages').add({
          'message':messageController.text,
          'timeStamp':DateTime.now(),
          'userId':FirebaseAuth.instance.currentUser!.uid,
        });
        messageController.clear();
        print("MEssage sent");


      // }
      // else{
      //   print("chat id doc does not exist");
      // }

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
  
  
//   Create chat with seller when buy book
Future<void> createChatConvo(String listingId,String orderId,String bookName,String sellerId) async{

    await FirebaseFirestore.instance.collection('chats').doc(FirebaseAuth.instance.currentUser!.uid).collection("convo").doc(orderId).set({
      'orderId':orderId,
      'bookId':listingId,
      'sellerId':sellerId,
      'orderDate':DateTime.now(),
      'bookName':bookName,
      'buyerId':FirebaseAuth.instance.currentUser!.uid,

    },SetOptions(merge: true));
    print("chat created");
    await FirebaseFirestore.instance.collection('chats').doc(sellerId).collection("convo").doc(orderId).set({
      'orderId':orderId,
      'bookId':listingId,
      'sellerId':sellerId,
      'orderDate':DateTime.now(),
      'bookName':bookName,
      'buyerId':FirebaseAuth.instance.currentUser!.uid

    },SetOptions(merge: true));
    print("chat created");
    await FirebaseFirestore.instance.collection('userMessages').doc(orderId).collection('messages').add({
      'message': "You Got the Order on ${bookName}",
      'timeStamp':DateTime.now(),
      'userId':FirebaseAuth.instance.currentUser!.uid,
    });
    
}

}
