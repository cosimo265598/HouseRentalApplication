import 'package:flutter/material.dart';
import 'package:rent_house/screens/chat/chat_room.dart';
import 'package:rent_house/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

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
                        child: Image.asset(
                          "assets/images/banner1.png",
                          //height: 300,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
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
                                      "Modern House",
                                      style: secondaryTitle,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "KBP Bandung, Indonesia",
                                      style: infoSecondaryTitle,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      "€ 350",
                                      overflow: TextOverflow.fade,
                                      style: primaryTitle,
                                    ),
                                    Text(
                                      "30 h ago",
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
                              "Listing Agent",
                              style: sectionSecondaryTitle,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/owner1.png",
                                  width: 50,
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "De Kezia",
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
                                        backgroundColor:
                                            Colors.deepPurple.shade100,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                                        Text("5")
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
                                        Text("3")
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
                                        Text("2")
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
                                        Text("Worker")
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
                                        Text("Students")
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
                                        Text("Family")
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
                              "Luxury homes at affordable prices with Bandung's hilly atmosphere. Located in a strategic location, flood free.Luxury homes at affordable prices with Bandung's hilly atmosphere. Located in a strategic location, flood free.Luxury homes at affordable prices with Bandung's hilly atmosphere. Located in a strategic location, flood free.",
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
                            height: 330,
                            padding: EdgeInsets.only(bottom: 5),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(width: 30),
                                FacilityCard(
                                  imageUrl: "assets/images/facilities1.png",
                                  title: "Swimming Pool",
                                ),
                                SizedBox(width: 20),
                                FacilityCard(
                                  imageUrl: "assets/images/facilities2.png",
                                  title: "4 Bedroom",
                                ),
                                SizedBox(width: 20),
                                FacilityCard(
                                  imageUrl: "assets/images/facilities3.png",
                                  title: "Garage",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),

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
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ChatRoom()));
            },
            backgroundColor: purpleColor,
            extendedIconLabelSpacing: 20,
            label: Text("Contact me"),
            icon: Icon(Icons.messenger_outline),
            heroTag: "btn2",
          ),
        ],
      ),
      /*
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: 90,
        color: whiteColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {},
              color: purpleColor,
              minWidth: 100,
              height: 50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              child: Text(
                "Message",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: priceTitle,
                ),
                Text(
                  "\$7,500",
                  style: priceText,
                ),
              ],
            ),
            Spacer(),
            MaterialButton(
              onPressed: () {},
              color: purpleColor,
              minWidth: 100,
              height: 50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              child: Text(
                "Call",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),*/
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
              Image.asset(
                widget.imageUrl,
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
