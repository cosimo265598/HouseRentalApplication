import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/screens/search_screen.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';

import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: header
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 30.0),
            child: Text(
              "Find Your\n\t\t\t\tPerfect home!",
              style: primaryTitle,
            ),
          ),
          // NOTE: slider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Recently added",
              style: secondaryTitle,
            ),
          ),
          Container(
            height: 216,
            child: ListView(
              padding: EdgeInsets.only(bottom: 10),
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 30),
                SliderCard(
                  imageUrl: "assets/images/banner1.png",
                  title: "Modern House",
                  city: "Bandung",
                  rating: 5,
                ),
                SizedBox(width: 30),
                SliderCard(
                  imageUrl: "assets/images/banner2.png",
                  title: "White House",
                  city: "Jakarta",
                  rating: 4,
                ),
              ],
            ),
          ),
          // NOTE: recommeded
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Around To You",
              style: secondaryTitle,
            ),
          ),
          Categories(),
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