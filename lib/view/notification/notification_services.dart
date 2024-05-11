import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted');
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted provision permission');
    } else {
      print('user denied permission');
    }
  }

  Future<String> getdevicetoken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void initlocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      // You might want to handle the response here.
    });
  }

  // void firebaseInit() {
  //   FirebaseMessaging.onMessage.listen((message) {
  //     print(message.notification!.title.toString());
  //     print(message.notification!.body.toString());
  //     initlocalNotification(context, message)
  //     showNotification(message);
  //   });
  // }
  //
  // Future<void> showNotification(RemoteMessage message) async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //   AndroidNotificationDetails(
  //     'your_channel_id', // Change this to your channel ID
  //     'Channel Name', // Change this to your channel name
  //
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     ticker: 'ticker',
  //   );
  //   const NotificationDetails platformChannelSpecifics =
  //   NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await _flutterLocalNotificationsPlugin.show(
  //     0, // Notification ID
  //     'Payment Completed', // Notification title
  //     message.toString(), // Notification body
  //     platformChannelSpecifics,
  //     payload: 'Custom_Sound', // You can use this to handle onTap events
  //   );
  //   // await FirebaseFirestore.instance.collection('appNotifications').doc(FirebaseAuth.instance.currentUser!.uid).collection('purchaseNotifications').add({
  //   //   'notificationTitle':'Payment Completed',
  //   //   'notificationBody':'Thank you for purchasing',
  //   //   'timestamp':DateTime.now()
  //   // });
  // }
}
