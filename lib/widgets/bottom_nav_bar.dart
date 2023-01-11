import 'package:flutter/material.dart';
import 'package:rent_house/theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final bottomBarItem = [
    'home',
    'home_search',
    'notification',
    'chat',
    'home_mark'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
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
            )
          ]),
    );
  }
}