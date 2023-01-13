import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';

import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

class SearchScreen extends StatefulWidget {
  const  SearchScreen({Key? key}) : super(key: key);
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
                decoration: searchDecoration,
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
}