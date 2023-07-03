import 'package:flutter/material.dart';

import '../models/houseModel.dart';
import '../screens/detail_page.dart';
import '../theme.dart';

class SliderCard extends StatelessWidget {
  final House house;
  final String imageUrl;
  final String title;
  final String city;
  final int rating;

  SliderCard({
    required this.imageUrl,
    required this.title,
    required this.city,
    required this.rating,
    required this.house,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
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
