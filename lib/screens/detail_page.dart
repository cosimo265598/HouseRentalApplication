import 'package:flutter/material.dart';
import 'package:rent_house/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            // NOTE: thumbnail image
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.asset(
                "assets/images/banner1.png",
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            // NOTE: content
            ListView(
              children: [
                SizedBox(
                  height: 250,
                ),
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
                          vertical: 24,
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
                            Row(
                              children: [1, 2, 3, 4, 5].map((e) {
                                return Icon(
                                  Icons.star,
                                  size: 12,
                                  color: (e <= 5) ? orangeColor : greyColor,
                                );
                              }).toList(),
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
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/images/message_icon.png",
                                    width: 30,
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/images/call_icon.png",
                                    width: 30,
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
                      // NOTE: facilities
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "House Facilities",
                          style: sectionSecondaryTitle,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 115,
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
                    ],
                  ),
                ),
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
                SizedBox(height: 110),
              ],
            ),
            // NOTE: button back
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(onPressed: () {  },
            backgroundColor: purpleColor,
            label: Text("Message"),
            icon: Icon( Icons.map_sharp),
          ),
          FloatingActionButton.extended(onPressed: () {  },
            backgroundColor: purpleColor,
            label: Text("Call Me"),
            icon: Icon( Icons.map_sharp),
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
class FacilityCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  FacilityCard({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: shadowColor,
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 100,
          height: 110,
          color: whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl),
              SizedBox(height: 9),
              Center(
                child: Text(
                  title,
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
