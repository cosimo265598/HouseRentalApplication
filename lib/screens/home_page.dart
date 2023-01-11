import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: header
              Padding(
                padding: EdgeInsets.only(
                  left: 30.0,
                  top: 30.0,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/menu_icon.png",
                    width: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 30.0),
                child: Text(
                  "Find Your\nPerfect Place!",
                  style: primaryTitle,
                ),
              ),
              // NOTE: search
              Container(
                padding: EdgeInsets.all(30.0),
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
                padding: EdgeInsets.only(left: 30, top: 30, bottom: 12),
                child: Text(
                  "Recommended For You",
                  style: secondaryTitle,
                ),
              ),
              RecommendCard(
                imageUrl: "assets/images/house1.png",
                title: "Wooden House",
                city: "Bandung",
                rating: 4,
              ),
              SizedBox(height: 16),
              RecommendCard(
                imageUrl: "assets/images/house2.png",
                title: "Wooden House",
                city: "Bogor",
                rating: 5,
              ),
              SizedBox(height: 16),
              RecommendCard(
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
        ),
      ),
    );
  }
}

// Slider card
class SliderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String city;
  final int rating;

  SliderCard({
    required this.imageUrl,
    required this.title,
    required this.city,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
      },
      child: Material(
        shadowColor: shadowColor,
        elevation: 5,
        borderRadius: BorderRadius.circular(14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: 209,
            width: 231,
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imageUrl,
                  width: 231,
                  height: 150,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: contentTitle,
                          ),
                          Text(
                            city,
                            style: infoText,
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [1, 2, 3, 4, 5].map((e) {
                          return Icon(
                            Icons.star,
                            color: (e <= rating) ? orangeColor : greyColor,
                            size: 12,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Recommend Card
class RecommendCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String city;
  final int rating;

  RecommendCard({
    required this.imageUrl,
    required this.title,
    required this.city,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Material(
        elevation: 6,
        shadowColor: shadowColor,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: whiteColor,
          ),
          child: Row(
            children: [
              Image.asset(
                imageUrl,
                width: 60,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: contentTitle,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    city,
                    style: infoText,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [1, 2, 3, 4, 5].map((e) {
                      return Icon(
                        Icons.star,
                        size: 12,
                        color: (e <= rating) ? orangeColor : greyColor,
                      );
                    }).toList(),
                  )
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: blackColor,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
