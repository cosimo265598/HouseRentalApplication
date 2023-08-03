import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/screens/search_screen.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';
import 'package:rent_house/models/houseModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

const int RECENT = 7;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // NOTE: header
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 30.0),
            child: Text(
              "Find Your\n\t\t\t\trental home!",
              style: primaryTitle,
            ),
          ),
          // NOTE: slider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Aggiunti di recente:",
              style: secondaryTitle,
            ),
          ),
          Container(
              height: 216,
              child: StreamBuilder<List<House>>(
                stream: readHouse(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasError)
                    return Container();
                  else if (snapshot.hasData) {
                    final house = snapshot.data;
                    //replicateData();
                    if (snapshot.data!.isNotEmpty) {
                      return Column(
                        children: [
                          ListView(
                            padding: EdgeInsets.only(bottom: 10),
                            scrollDirection: Axis.horizontal,
                            children: house!.map(buildExample).toList(),
                          ),
                        ],
                      );
                    } else
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sentiment_dissatisfied,
                              size: 60,
                              color: Colors.amber,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Non sono presenti annunci negli ultimi "+RECENT.toString()+" giorni",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Catalogo",
              style: secondaryTitle,
            ),
          ),
          Categories(),
          loadHouseRent(),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  Stream<List<House>> readHouse() => FirebaseFirestore.instance
      .collection('Houses')
      .where('pubDate',
          isGreaterThan: DateTime.now().subtract(const Duration(days: RECENT)))
      .orderBy('pubDate', descending: true)
      .limit(10)
      .snapshots()
      .map((snap) =>
          snap.docs.map((doc) => House.fromJson(doc.data())).toList());

  Widget buildExample(House h) => Row(children: [
        SizedBox(width: 30),
        SliderCard(
          house: h,
        )
      ]);

  Widget houses(House h) => Column(
        children: [
          SizedBox(
            height: 20,
          ),
          PreviewCard(
            house: h,
          ),
        ],
      );

  Stream<List<House>> readHouseWithFilter() =>
      FirebaseFirestore.instance.collection('Houses').snapshots().map((snap) =>
          snap.docs.map((doc) => House.fromJson(doc.data())).toList());

  Widget loadHouseRent() {
    return StreamBuilder<List<House>>(
      stream: readHouseWithFilter(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError)
          return Container();
        else if (snapshot.hasData) {
          final house = snapshot.data;
          return Column(
            children: house!.map(houses).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
