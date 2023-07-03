

import 'package:flutter/material.dart';

import '../models/houseModel.dart';
import '../screens/detail_page.dart';
import '../theme.dart';

class PreviewCard extends StatelessWidget {
  final House house;
  PreviewCard({
    required this.house,
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
          height: 170,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: whiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                      children: [
                        Image.asset(
                          "assets/images/banner1.png",
                          width: 90,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: -8,
                          left: -8,
                          child: MaterialButton(
                            onPressed: () { },
                            minWidth: 30,
                            height: 30,
                            padding: EdgeInsets.all(5),
                            color: Colors.white.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.bookmark,
                              size: 14,
                            ),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        house.titolo,
                        style: contentTitle,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        house.city,
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
                      /*Row(
                        children: [1, 2, 3, 4, 5].map((e) {
                          return Icon(
                            Icons.star,
                            size: 12,
                            color: (e <= rating) ? orangeColor : greyColor,
                          );
                        }).toList(),
                      ),*/
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
                                  Text(house
                                      .houseComponent['bedroom']
                                      .toString())
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
                                  Text(house
                                      .houseComponent['bathroom']
                                      .toString())
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
                                  Text(house
                                      .houseComponent['kitchen']
                                      .toString())
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(houseSelected: house,)));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: blackColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Updated: 31/12/56",
                    style: infoText,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}