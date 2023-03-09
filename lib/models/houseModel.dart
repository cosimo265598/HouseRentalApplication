import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class House {
  String idDocument;
  String titolo;
  Map<String, double> houseComponent;
  Map<String, bool> rentTo;
  DateTime pubDate;
  double prezzo;
  GeoPoint posizione;
  String address;
  List<String> photo;
  String description;
  String agentId;

  Map<String, dynamic> toJson() {
    return {
      "idDocument": idDocument,
      "titolo": titolo,
      "component": houseComponent,
      "renTo": rentTo,
      "pubDate": pubDate,
      "prezzo": prezzo,
      "posizione": posizione,
      "adress": address,
      "photo": photo,
      "description": description,
      "agendId": agentId
    };
  }

  static House fromJson(Map<String, dynamic> json) {
    print( json['agendId'] );
    return House(json['idDocument'], json['titolo'], json['component'], json['rentTo'], (json['pubDate'] as Timestamp).toDate(),
        json['prezzo'], (json['posizione'] as GeoPoint), json['adress'], json['photos'], json['description'], json['agendId']);
  }

  House(
      this.idDocument,
      this.titolo,
      this.houseComponent,
      this.rentTo,
      this.pubDate,
      this.prezzo,
      this.posizione,
      this.address,
      this.photo,
      this.description,
      this.agentId);
}
