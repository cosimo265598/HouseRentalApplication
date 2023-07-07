import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/houseModel.dart';
import '../screens/detail_page.dart';
import '../theme.dart';

class SliderCard extends StatelessWidget {
  final House house;
  SliderCard({
    required this.house,
  });

  Widget checkPhoto(House h ){
      if(house.photos.isNotEmpty)
        return Image.memory(
          base64Decode(house.photos[0]),
          width: 231,
          height: 150,
          fit: BoxFit.fill,
        );

      return Image.asset(
          "assets/images/noimage.png",
          width: 231,
          height: 150,
          fit: BoxFit.fill,
        );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(houseSelected: house,)));
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
                checkPhoto(house),
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
                            house.titolo,
                            style: contentTitle,
                          ),
                          Text(
                            house.city,
                            style: infoText,
                          )
                        ],
                      ),
                      Spacer(),
                      /*Row(
                        children: [1, 2, 3, 4, 5].map((e) {
                          return Icon(
                            Icons.star,
                            color: (e <= rating) ? orangeColor : greyColor,
                            size: 12,
                          );
                        }).toList(),
                      ),*/
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
