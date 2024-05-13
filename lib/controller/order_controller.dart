import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
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
  Future<void> changeOrderStatus(String orderId,String buyerId,String bookId,String bookName) async {
    try {
      isLoading.value = true;

      await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .update({
        'deliveryStatus': true,
      });
      await FirebaseFirestore.instance
          .collection('userNotifications').doc(buyerId)
          .collection('notifications')
          .add({
        'bookId': bookId,
        'orderId':orderId,
        // 'price':price,
        'time':DateTime.timestamp(),
        'title': "Seller has marked ${bookName} as delivered",
        'userId':FirebaseAuth.instance.currentUser!.uid,
      });
      orderStatus.value = true;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print("Error changing order status $e");
    }
  }
}
