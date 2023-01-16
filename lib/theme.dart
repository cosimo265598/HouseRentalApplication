import 'package:flutter/material.dart';

Color blackColor = Color(0xff253342);
Color purpleColor = Color(0xff5F6AC4);
Color greyColor = Color(0xffAFAFAF);
Color orangeColor = Color(0xffE76D81);
Color whiteColor = Color(0xffFFFFFF);
Color shadowColor = Color(0x26616161);
Color redColor = Color(0xa6fa374e);


// style
TextStyle primaryTitle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w600,
  color: blackColor,
);

TextStyle sectionTitle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

TextStyle sectionSecondaryTitle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

TextStyle contentTitle = TextStyle(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle infoText = TextStyle(
  color: greyColor,
  fontWeight: FontWeight.w400,
  fontSize: 10,
);

TextStyle secondaryTitle = TextStyle(
  color: blackColor,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle infoSecondaryTitle = TextStyle(
  color: greyColor,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

TextStyle facilitiesTitle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w500,
  fontSize: 10,
);

TextStyle descText = TextStyle(
  color: greyColor,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

TextStyle priceTitle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: greyColor,
);

TextStyle priceText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: purpleColor,
);

// Input Decoration Style
InputDecoration searchDecoration = InputDecoration(
  filled: true,
  fillColor: whiteColor,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide.none,
  ),
  hintText: "Find your rent home",
  contentPadding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 19,
  ),
  suffixIcon: Padding(
    padding: EdgeInsets.all(8),
    child: MaterialButton(
      onPressed: () {},
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
    ),
  ),
  prefixIcon: Padding(
    padding: EdgeInsets.all(8),
    child: Icon(
        Icons.search_rounded,
        color: purpleColor,
        size: 18,
      ),
  ),
);
