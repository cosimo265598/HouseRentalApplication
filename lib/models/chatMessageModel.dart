import 'package:flutter/cupertino.dart';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class ChatMessage{
  String message;
  DateTime timestamp;
  String sentBy;
  ChatMessage({required this.message, required this.timestamp, required this.sentBy});

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'timestamp': timestamp,
      'sentBy': sentBy,
    };
  }


  static ChatMessage fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message: json['message'] ,
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      sentBy: json['sentBy'],
    );
  }
}

class ChatMessageExample{
  String messageContent;
  String messageType;
  ChatMessageExample({required this.messageContent, required this.messageType});

}