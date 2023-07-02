import 'package:flutter/material.dart';

class UserRegistered {
  String displayName;
  String photoUrl;
  bool online;
  String email;
  UserRegistered({required this.displayName, required this.photoUrl, required this.online, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'photoUrl': photoUrl,
      'online': online,
      'email': email
    };
  }

  static UserRegistered fromJson(Map<String, dynamic> json) {
    return UserRegistered(
      displayName: json['displayName'] ,
      photoUrl: json['photoUrl'] ,
      online: json['online'] ,
      email : json['email']
    );
  }
}
