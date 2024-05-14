import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/controller/notification_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final NotificationController notificationController =
      Get.put(NotificationController());
  RxBool orderStatus = false.obs;
  RxBool isLoading = false.obs;
  Future<void> checkOrderStatus(String orderId) async {
    try {
      isLoading.value = true;
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId) //Chat id is our order id
          .get();
      if (documentSnapshot.exists) {
        dynamic order = documentSnapshot.data();
        orderStatus.value = order['deliveryStatus'];
        print(order['deliveryStatus']);
        update();
      } else {
        isLoading.value = false;

        print("NO order found with $orderId");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print("Error getting order status $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changeOrderStatus(
      String orderId, String buyerId, String bookId, String bookName,String sellerId) async {
    try {
      isLoading.value = true;

      await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .update({
        'deliveryStatus': true,
      });
      await FirebaseFirestore.instance
          .collection('userNotifications')
          .doc(buyerId)
          .collection('notifications')
          .add({
        'bookId': bookId,
        'orderId': orderId,
        // 'price':price,
        'time': DateTime.timestamp(),
        'title': "Seller has marked ${bookName} as delivered",
        'userId': FirebaseAuth.instance.currentUser!.uid,
      });
      DocumentSnapshot usersnap = await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(buyerId== FirebaseAuth.instance.currentUser!.uid?sellerId:buyerId)
          .get();
      dynamic data = usersnap.data();
      String fcmToken = data['fcmToken'];
      print(buyerId);
      if(buyerId!= FirebaseAuth.instance.currentUser!.uid){
        notificationController.sendFcmMessage('Order Alert',
            "Seller has marked ${bookName} as delivered", buyerId);
      }else{
        notificationController.sendFcmMessage('Order Alert',
            "Buyer has marked ${bookName} as Received", sellerId);
      }


      orderStatus.value = true;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print("Error changing order status $e");
    }
  }
}
