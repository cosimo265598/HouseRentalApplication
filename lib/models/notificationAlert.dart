import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationAlert {
  String id;
  String message;
  DateTime date;
  String toUser;
  String fromUser;
  String appId;
  NotificationAlert({required this.message, required this.date, required this.toUser,
    required this.id, required this.fromUser, required this.appId});

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'date': date,
      'toUser': toUser,
      'id': id,
      'fromUser' :fromUser,
      'appId': appId
    };
  }

  static NotificationAlert fromJson(Map<String, dynamic> json) {
    return NotificationAlert(
        message: json['message'] ,
        date: (json['date'] as Timestamp).toDate(),
        toUser: json['toUser'] ,
      id: json['id'],
      fromUser: json['fromUser'],
      appId: json['appId']
    );
  }
}
