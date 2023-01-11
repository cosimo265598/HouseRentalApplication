import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {

  int currentIndex=0;
  List<Widget> pages = [
    //Home(),
    //History(),
    //AddTransaction(), // add transaction pages
    //Statisticspage(),// statistics
    //Settings(),// settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: header
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 30.0),
                child: Text(
                  "Find Your\nPerfect Place!",
                  style: primaryTitle,
                ),
              ),
              // NOTE: search
              Container(
                padding: EdgeInsets.all(20.0),
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
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(onPressed: () {  },
        backgroundColor: purpleColor,
        label: Text("Map view"),
        icon: Icon( Icons.map_sharp),

      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                //offset: Offset(0, 3),
              )
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home_rounded,
                size: 30,
              ),
              Icon(
                Icons.history_rounded,
                size: 30,
              ),
              Icon(
                Icons.add_circle_outline_rounded,
                size: 30,
              ),
              Icon(
                Icons.stacked_bar_chart_rounded,
                size: 30,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {

                  });
                },
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
              )
            ]),
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
class AroundCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String city;
  final int rating;

  AroundCard({
    required this.imageUrl,
    required this.title,
    required this.city,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
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
