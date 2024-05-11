import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  Future<void> storeNotification(
      int price, String orderId, String bookId) async {
    await FirebaseFirestore.instance.collection('userNotifications').doc( FirebaseAuth.instance.currentUser!.uid,).collection('notifications').add({
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'title': 'you successfully purchased',
      'time': DateTime.timestamp(),
      'price': price,
      'orderId': orderId,
      'bookId': bookId
    });
    print('Notification sent');
  }
}
