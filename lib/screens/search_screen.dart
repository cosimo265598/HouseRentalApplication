import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';

import '../models/houseModel.dart';
import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String searchQuery = "";

  Stream<List<House>> readHouse() => _firestore
      .collection('Houses')
      .where('titolo', isGreaterThanOrEqualTo: searchQuery)
      .where('titolo', isLessThan: searchQuery + 'z')
      .snapshots()
      .map((snap) =>
          snap.docs.map((doc) => House.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: search
          Container(
            padding: EdgeInsets.all(10.0),
            child: Material(
              elevation: 6,
              shadowColor: shadowColor,
              borderRadius: BorderRadius.circular(28),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: greyColor.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Find your rent home",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 19,
                  ),

                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.search_rounded,
                      color: purpleColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // NOTE: slider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "Risultati:",
              style: secondaryTitle,
            ),
          ),
          Container(
            height: 600,
            child: Center(
              child: StreamBuilder<List<House>>(
                stream: readHouse(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final searchResults = snapshot.data!;
                    // Build the UI using the searchResults
                    return ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final house = searchResults[index];
                        // Build the widget for each search result
                        return ListTile(
                          trailing: Icon(Icons.maps_home_work_sharp),
                          title: Text(house.titolo)
                          ,
                          // Customize the display of each search result as needed
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(houseSelected: house,),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildModalSheet() => DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) =>
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
          decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                controller: scrollController,
                children: [
                  _buildFilterSearch(Icons.location_city_outlined, "Search on"),
                  _buildFilterSearch(Icons.price_check_rounded, "Price"),
                  MaterialButton(

                    color: purpleColor,
                    minWidth: 39,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () {  },
                    child: Icon(
                      Icons.done_rounded,
                      color: whiteColor,
                      size: 25,
                    ),
                  ),
                ],
              ),
          ),
        ),
            ),
      );

  Widget _buildFilterSearch (IconData icon, String hint) => TextField(
    decoration: InputDecoration(
      filled: true,
      fillColor: whiteColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide.none,
      ),
      hintText: "Find your rent home",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 19,
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          icon,
          color: purpleColor,
          size: 18,
        ),
      ),
    ),
  );
}
