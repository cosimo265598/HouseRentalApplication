import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/screens/appointment/appointment.dart';
import 'package:rent_house/screens/chat/chat_room.dart';
import 'package:rent_house/theme.dart';

import '../models/houseModel.dart';
import '../models/user.dart';

class DetailPage extends StatelessWidget {
  final House houseSelected;

  DetailPage({required this.houseSelected});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserRegistered _userRegistered;

  Future<UserRegistered> retriveInfoOfAgent(String idUser) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('Users').doc(idUser).get();
    if (snapshot.exists) {
      UserRegistered userRegistered =
          UserRegistered.fromJson(snapshot.data()! as Map<String, dynamic>);
      return userRegistered;
    } else {
      return UserRegistered(
          displayName: "", photoUrl: "", online: true, email: "");
    }
  }

  Widget infoOfAgent(String idUser) {
    return FutureBuilder<UserRegistered>(
      future: retriveInfoOfAgent(idUser),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          UserRegistered userRegistered = snapshot.data!;
          _userRegistered = snapshot.data!;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(userRegistered.photoUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 50,
                height: 50,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userRegistered.displayName,
                    style: contentTitle,
                  ),
                  Text(
                    "House Owner",
                    style: infoText,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.phone,
                      color: purpleColor,
                      size: 40,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.deepPurple.shade100,
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          // Handle the case when the user is not found
          return Container();
        }
      },
    );
  }

  Widget checkIfHouseIsMine(
      FirebaseAuth _auth, String agentId, BuildContext context) {
    if (_auth.currentUser!.uid.compareTo(agentId) == 0) return Container();
    List<String> buildChatId = [_auth.currentUser!.uid, agentId]..sort();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChatRoom(
                          idChatRoom: buildChatId.join(""),
                          photoUrl: _userRegistered.photoUrl,
                          displayName: _userRegistered.displayName,
                        )));
          },
          backgroundColor: purpleColor,
          extendedIconLabelSpacing: 20,
          label: Text("Contact me"),
          icon: Icon(Icons.messenger_outline),
          heroTag: "btn2",
        ),
        FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => AppointmentScreen(toUser: _userRegistered.email, titolo: houseSelected.titolo)));
          },
          backgroundColor: purpleColor,
          extendedIconLabelSpacing: 20,
          label: Text("Appointment"),
          icon: Icon(Icons.calendar_month_outlined),
          heroTag: "btn3",
        )
      ],
    );
  }

  Widget checkPhoto(House h,BuildContext context ){
    if(h.photos.isNotEmpty)
      return Image.memory(
        base64Decode(h.photos[0]),
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      );

      return Image.asset(
        "assets/images/noimage.png",
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      );
  }
  List<Widget> returnPhotos(House h){
    List<Widget> photosOfAppartment =[];

    for (String p in h.photos){
      photosOfAppartment.add(Row(
        children: [
          SizedBox(width: 30),
          FacilityCard(
            imageUrl: p,
            title: "Foto",
          ),
        ],
      ),);
    }
    return photosOfAppartment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: checkPhoto(houseSelected, context)
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          minWidth: 30,
                          height: 30,
                          padding: EdgeInsets.all(5),
                          color: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                        color: whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // NOTE: title
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 20,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      houseSelected.titolo,
                                      style: secondaryTitle,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      houseSelected.address,
                                      style: infoSecondaryTitle,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      houseSelected.prezzo.toString(),
                                      overflow: TextOverflow.fade,
                                      style: primaryTitle,
                                    ),
                                    Text(
                                      houseSelected.pubDate.day.toString() +
                                          "/" +
                                          houseSelected.pubDate.month
                                              .toString() +
                                          "/" +
                                          houseSelected.pubDate.year.toString(),
                                      overflow: TextOverflow.fade,
                                      style: infoSecondaryTitle,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // NOTE: agent
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Agent",
                              style: sectionSecondaryTitle,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: infoOfAgent(houseSelected.agentId)),
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Components of home",
                              style: sectionSecondaryTitle,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.bed_rounded,
                                          size: 16,
                                        ),
                                        Text(houseSelected
                                            .houseComponent['bedroom']
                                            .toString())
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.bathtub_rounded,
                                          size: 16,
                                        ),
                                        Text(houseSelected
                                            .houseComponent['bathroom']
                                            .toString())
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.cookie,
                                          size: 16,
                                        ),
                                        Text(houseSelected
                                            .houseComponent['kitchen']
                                            .toString())
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // NOTE: facilities
                          //SizedBox(height: 24),
                          SizedBox(height: 24),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Rent home to",
                              style: sectionSecondaryTitle,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    height: 20,
                                    //width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.work_outlined,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Worker: " +
                                            (houseSelected.rentTo['worker']
                                                        .toString() ==
                                                    "true"
                                                ? "SI"
                                                : "NO"))
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    height: 20,
                                    //width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.menu_book_rounded,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Students: " +
                                            (houseSelected.rentTo['student']
                                                        .toString() ==
                                                    "true"
                                                ? "SI"
                                                : "NO"))
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    height: 20,
                                    //width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.family_restroom_rounded,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Family: " +
                                            (houseSelected.rentTo['family']
                                                        .toString() ==
                                                    "true"
                                                ? "SI"
                                                : "NO"))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // NOTE: facilities
                          //SizedBox(height: 24),
                          SizedBox(height: 24),
                          // NOTE: description
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Description",
                              style: sectionSecondaryTitle,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              houseSelected.description,
                              style: descText,
                            ),
                          ),
                          SizedBox(height: 24),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Photos",
                              style: sectionSecondaryTitle,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 250,
                            padding: EdgeInsets.only(bottom: 5),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                returnPhotos(houseSelected),
                            ),
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          checkIfHouseIsMine(_auth, houseSelected.agentId, context),
    );
  }
}

// Facilities Card
class FacilityCard extends StatefulWidget {
  final String imageUrl;
  final String title;

  FacilityCard({
    required this.imageUrl,
    required this.title,
  });

  @override
  State<FacilityCard> createState() => _FacilityCardState();
}

class _FacilityCardState extends State<FacilityCard> {
  double _scale = 1.0;
  double _factorscale = 3;
  double _previousScale = 1.0;
  double x = 0;
  double y = 0;
  late TransformationController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: shadowColor,
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 300,
          //height: 200,
          color: whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Image.memory(
                base64Decode(widget.imageUrl),
                  //height: 100,
              ),
              SizedBox(height: 9),
              Center(
                child: Text(
                  widget.title,
                  style: facilitiesTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
