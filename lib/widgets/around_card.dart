

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/houseModel.dart';
import '../utils/utility.dart';
import '../screens/detail_page.dart';
import '../theme.dart';

class PreviewCard extends StatelessWidget {
  final House house;
  PreviewCard({
    required this.house,
  });

  Widget checkImage(){
    if(house.photos.isNotEmpty)
      return Image.memory(
        base64Decode(house.photos[0]),
        width: 120,
        height: 150,
        fit: BoxFit.cover,
      );

    return  Image.asset(
        "assets/images/noimage.png",
        width: 120,
        height: 150,
        fit: BoxFit.cover,
      );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          //width: MediaQuery.of(context).size.width,
          //height: 170,
          //padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey.withAlpha(20),
          ),
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                      child: checkImage()
                  ),),
                  SizedBox(width: 15),
                  Flexible(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            house.titolo,
                            style: secondaryTitle,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.location_pin,size: 16,),
                              Expanded(
                                child: Text(
                                    house.address,
                                    style: infoText,
                                  ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.calendar_month,size: 16,),
                              Expanded(
                                child: Text(
                                  Utility.convertDateToStringReadable(house.pubDate),
                                  style: infoText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.euro,size: 16,),
                              Expanded(
                                child: Text(
                                  house.prezzo.truncateToDouble().toString(),
                                  style: sectionSecondaryTitle,
                                ),
                              ),
                            ],
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
                          /*SizedBox(
                            height: 8,
                          ),*/
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
                                    color: Colors.grey[400],
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
                                    color: Colors.grey[400],
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
                                    color: Colors.grey[400],
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
                  ),
                  SizedBox(width: 20,),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(houseSelected: house,)));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: blackColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
        ),

    );
  }
}