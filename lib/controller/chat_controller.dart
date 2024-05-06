import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
  void sendmessage(TextEditingController messageController) {
    if (messageController.text.isNotEmpty) {
      messages.add({"sendby": 'me', "message": messageController.text});
      messageController.clear();
      messages.refresh();
    }
  }

}
