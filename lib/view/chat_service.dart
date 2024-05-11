import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'message.dart';

class ChatService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //send message


  Future<void> sendMessage(String receiverId, String message, senderName , dpUrl) async {
    // get current user
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();

    final Timestamp timestamp = Timestamp.now();

    bool isBlocked = await checkIfBlocked(receiverId, currentUserId);

    if (isBlocked) {
      // Show a snackbar or handle the blocked user scenario
      // You can customize this based on your UI requirements
      debugPrint('You are blocked by the receiver');
      Get.snackbar(
        'Message Sending Failed',
        'You have been blocked by Receiver!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        borderRadius: 10.0,
      );
      return;
    } else {
      debugPrint('You are Not Blocked by the receiver');
    }

    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp,
        senderName: senderName,
        senderDp: dpUrl

      //isRead: isRead, // Set isRead status
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await _firestore.collection('chat_rooms').doc(chatRoomId).set({
      "participants": [currentUserId, receiverId],
      "last_message": message,
      "last_message_time_stamp": timestamp,
    }).whenComplete(
          () async {
        await _firestore
            .collection("chat_rooms")
            .doc(chatRoomId)
            .collection("messages")
            .add(newMessage.toFirestore());
      },
    );


  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages') //
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<bool> checkIfBlocked(String receiverId, String currentUserId) async {
    try {
      // Fetch the block list document for the receiver
      DocumentSnapshot blockListDoc =
      await _firestore.collection('BlockList').doc(receiverId).get();

      // Cast the data to Map<String, dynamic>?
      Map<String, dynamic>? data = blockListDoc.data() as Map<String, dynamic>?;

      // Check if the current user is in the blocked array
      List<dynamic>? blockedUsers = data?['Blocked'] as List<dynamic>?;

      if (blockedUsers != null && blockedUsers.contains(currentUserId)) {
        return true; // Current user is blocked
      }

      return false; // Current user is not blocked
    } catch (e) {
      debugPrint("Error checking block list: $e");
      return false; // Handle error, for simplicity returning false
    }
  }
}
