import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/houseModel.dart';
import '../screens/detail_page.dart';
import '../theme.dart';

class RentHouse extends StatelessWidget {
  final House house;

  RentHouse({
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
          //height: 170,
          //padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: whiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 90,
                      height: 90,
                      child: Image.memory(
                        base64Decode(house.photos[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            child: FaIcon(Icons.edit_outlined,
                                color: Colors.green),
                            style: OutlinedButton.styleFrom(
                              fixedSize: Size(40, 40),
                              side: BorderSide(width: 2, color: purpleColor),
                              shape: CircleBorder(),
                            ),
                            onPressed: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
                            },
                          ),
                          OutlinedButton(
                            child: FaIcon(Icons.remove_red_eye_outlined,
                                color: Colors.blue),
                            style: OutlinedButton.styleFrom(
                              fixedSize: Size(40, 40),
                              side: BorderSide(width: 2, color: purpleColor),
                              shape: CircleBorder(),
                            ),
                            onPressed: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
                            },
                          ),
                          OutlinedButton(
                            child: FaIcon(Icons.delete_outline_outlined,
                                color: Colors.red),
                            style: OutlinedButton.styleFrom(
                              fixedSize: Size(40, 40),
                              side: BorderSide(width: 2, color: purpleColor),
                              shape: CircleBorder(),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
