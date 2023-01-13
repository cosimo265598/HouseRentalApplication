import 'package:flutter/material.dart';

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers(
      {required String this.name,
      required String this.messageText,
      required String this.imageURL,
      required String this.time});
}
