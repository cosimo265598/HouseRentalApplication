import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class House {
  String idDocument;
  String titolo;
  Map<String, int> houseComponent ;
  Map<String, bool> rentTo ;
  DateTime pubDate;
  double prezzo;
  GeoPoint posizione;
  String address;
  List<String> photos;
  String description;
  String agentId;
  String city;

  Map<String, dynamic> toJson() {
    return {
      'idDocument': this.idDocument,
      'titolo': this.titolo,
      'component': this.houseComponent,
      'rentTo': this.rentTo,
      'pubDate': this.pubDate,
      'prezzo': this.prezzo,
      'posizione': this.posizione,
      'address': this.address,
      'photos': this.photos,
      'description': this.description,
      'agendId': this.agentId,
      'city' : this.city,
    };
  }

  static House fromJson(Map<String, dynamic> json) {
    return House(
      idDocument: json['idDocument'] ,
      titolo: json['titolo'],
      houseComponent: Map.from(json['component']),
      rentTo: Map.from(json['rentTo']),
      pubDate: (json['pubDate'] as Timestamp).toDate(),
      prezzo: double.parse(json['prezzo'].toString()),
      posizione: (json['posizione'] as GeoPoint),
      address: json['address'],
      photos: List.from(json['photos']),
      description: json['description'],
      agentId: json['agendId'],
      city: json['city'],
    );
  }

  static Map<String,int> fromJsonHouseComponent(Map<String, dynamic> jsonC){
    Map<String,int> map = {
    'bathroom' : jsonC['bathroom'],
    'bedroom' :jsonC['bedroom'] ,
    'kitchen': jsonC['kitchen'] ,
    };
    return map;
  }

  static Map<String,bool> fromJsonRentTo(Map<String, dynamic> jsonR){
    Map<String,bool> map = {
      'student' : jsonR['student'],
      'worker' :jsonR['worker'] ,
      'family': jsonR['family'] ,
    };
    return map;
  }

  House({
      required this.idDocument,
      required this.titolo,
      required this.houseComponent,
      required this.rentTo,
      required this.pubDate,
      required this.prezzo,
      required this.posizione,
      required this.address,
      required this.photos,
      required this.description,
      required this.agentId,
      required this.city,
  });
}
