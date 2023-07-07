import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserAppointment {
  String id;
  String idUser;
  String titolo;
  DateTime date;
  bool confirmed;
  String createdBy;
  UserAppointment({required this.id, required this.idUser, required this.titolo, required this.date, required this.confirmed,required this.createdBy});

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'titolo': titolo,
      'date': date,
      'confirmed': confirmed,
      'createdBy': createdBy,
      'id': id,
    };
  }

  static UserAppointment fromJson(Map<String, dynamic> json) {
    return UserAppointment(
        idUser: json['idUser'] ,
        titolo: json['titolo'] ,
        date: (json['date'] as Timestamp).toDate() ,
        confirmed: json['confirmed'],
        createdBy: json['createdBy'],
      id: json['id'],
    );
  }
}
