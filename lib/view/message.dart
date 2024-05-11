import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String senderDp;
  final String receiverId;
  final String message;
  final String senderName;
  final Timestamp timestamp;

  //final bool isRead;

  Message(
      {required this.senderId,
        required this.senderEmail,
        required this.senderDp,
        required this.receiverId,
        required this.message,
        required this.senderName,
        required this.timestamp,

        // required this.isRead,
      });

  factory Message.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Message(
      message: data?['message'],
      receiverId: data?['receiverId'],
      senderId: data?['senderId'],
      timestamp: data?['timestamp'], senderEmail: data?['senderEmail'], senderName: data?['senderName'], senderDp: data?['senderDp'],

    );
  }


  Map<String, dynamic> toFirestore() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      "senderName": senderName,
      'timestamp': timestamp,
      'senderDp': senderDp,

      //'isRead': isRead,
    };
  }
}