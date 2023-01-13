import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';

import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

class BookmarkedScreen extends StatefulWidget {
  const  BookmarkedScreen({Key? key}) : super(key: key);
  @override
  State<BookmarkedScreen> createState() => _BookmarkedScreenState();
}

class _BookmarkedScreenState extends State<BookmarkedScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: slider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Text(
              "Preferiti",
              style: secondaryTitle,
            ),
          ),
          AroundCard(
            imageUrl: "assets/images/house1.png",
            title: "Wooden House",
            city: "Bandung",
            rating: 4,
          ),
          AroundCard(
            imageUrl: "assets/images/house2.png",
            title: "Wooden House",
            city: "Bogor",
            rating: 5,
          ),
          AroundCard(
            imageUrl: "assets/images/house3.png",
            title: "Hill House",
            city: "Makasar",
            rating: 3,
          ),
          AroundCard(
            imageUrl: "assets/images/house2.png",
            title: "Wooden House",
            city: "Bogor",
            rating: 5,
          ),
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