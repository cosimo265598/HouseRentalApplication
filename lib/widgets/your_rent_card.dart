

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/detail_page.dart';
import '../theme.dart';

class RentHouse extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String city;
  final int rating;

  RentHouse({
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
        elevation: 10,
        shadowColor: shadowColor,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: MediaQuery.of(context).size.width,
          //height: 170,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: whiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    imageUrl,
                    width: 90,
                    height: 100,
                    fit: BoxFit.fill,
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
                      Text(
                        "Quartiere: San Paolo",
                        style: infoText,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.room_service_outlined,
                                    size: 16,
                                  ),
                                  Text("2")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),

                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Updated: 31/12/2023",
                    style: infoText,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
                    },
                    color: purpleColor,
                    minWidth: 100,
                    height: 39,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: FaIcon(FontAwesomeIcons.solidEye,color: whiteColor,),
                  ),
                  MaterialButton(
                    onPressed: () {
                    },
                    color: redColor,
                    //minWidth: 100,
                    height: 39,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: FaIcon(FontAwesomeIcons.remove,color: whiteColor,),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}