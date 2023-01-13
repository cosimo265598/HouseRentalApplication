import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';

import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(8),
                    child: MaterialButton(
                      onPressed: () => showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => _buildModalSheet()),
                      color: purpleColor,
                      minWidth: 39,
                      height: 39,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.display_settings_rounded,
                        color: whiteColor,
                        size: 16,
                      ),
                    ),
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
              "What we found:",
              style: secondaryTitle,
            ),
          ),
          AroundCard(
            imageUrl: "assets/images/house1.png",
            title: "Wooden House",
            city: "Bandung",
            rating: 4,
          ),
          SizedBox(height: 10),
          AroundCard(
            imageUrl: "assets/images/house2.png",
            title: "Wooden House",
            city: "Bogor",
            rating: 5,
          ),
          SizedBox(height: 10),
          AroundCard(
            imageUrl: "assets/images/house3.png",
            title: "Hill House",
            city: "Makasar",
            rating: 3,
          ),
          SizedBox(height: 10),
          AroundCard(
            imageUrl: "assets/images/house2.png",
            title: "Wooden House",
            city: "Bogor",
            rating: 5,
          ),
          SizedBox(height: 10),
          AroundCard(
            imageUrl: "assets/images/house3.png",
            title: "Hill House",
            city: "Makasar",
            rating: 3,
          ),
          SizedBox(
            height: 60,
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
                  _buildFilterSearch(Icons.add, "Search on"),
                  _buildFilterSearch(Icons.price_check, "Price"),
                  _buildFilterSearch(Icons.work_outlined, "Worker"),
                  _buildFilterSearch(Icons.map, "Hello man"),
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
