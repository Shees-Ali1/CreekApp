

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class NotificationController extends GetxController {
  Future<void> storeNotification(
      int price, String orderId, String bookId) async {
    await FirebaseFirestore.instance
        .collection('userNotifications')
        .doc(
          FirebaseAuth.instance.currentUser!.uid,
        )
        .collection('notifications')
        .add({
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'title': 'you successfully purchased',
      'time': DateTime.timestamp(),
      'price': price,
      'orderId': orderId,
      'bookId': bookId
    });
    print('Notification sent');
  }

  Future<void> sendFcmMessage(String title, String message,String sellerId) async {
    try {
      DocumentSnapshot docref =  await FirebaseFirestore.instance.collection('userDetails').doc(sellerId).get();
      dynamic seller = docref.data();
      String fcmToken = seller['fcmToken'];

      var url = 'https://fcm.googleapis.com/fcm/send';
      var header = {
        "Content-Type": "application/json",
        "Authorization":
        "key=AAAA_pa3Gss:APA91bHFIqNtUNX7_WS6A7V9QriLHLFAAyU62eXHwDRBL_7UbYmc1EyoBpC9EoZgVSg0fNZ2XZKmByaqYwxqO1ar_3hSLfBBIcY3cmqBrZdXlYglx9eowgSM-fONPozs1paBVk6ZlRxH",
      };
      var request = {
        "notification": {
          "title": title,
          "text": message,
          "sound": "default",
          "color": "#990000",
        },
        "priority": "high",
        "to": fcmToken,
      };

      var client = new Client();

      await client.post(Uri.parse(url), headers: header, body: json.encode(request));
    } catch (e, s) {
      print(e);
    }
  }

}
