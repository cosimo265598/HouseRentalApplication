import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/screens/bookmarked_screen.dart';
import 'package:rent_house/screens/chat/chatPage.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/screens/google_maps_search_screen.dart';
import 'package:rent_house/screens/home_page_screen.dart';
import 'package:rent_house/screens/profile_screen.dart';
import 'package:rent_house/screens/search_screen.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';

import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

class HomePage extends StatefulWidget {
  const  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {

  int currentIndex=1;
  List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    BookmarkedScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopBar(),
      ),
      body: SafeArea(
          child:  ChatList(),//_pages[currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: currentIndex==1 ? FloatingActionButton.extended(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => GoogleMapsScreen()));
      },
        backgroundColor: purpleColor,
        label: Text("Map view"),
        icon: Icon( Icons.map_sharp),
        heroTag: "btn1",
      ):null,
      bottomNavigationBar:CurvedNavigationBar(
        buttonBackgroundColor: purpleColor,
        index: currentIndex,
        color: Colors.grey.shade200,
        animationDuration: Duration(milliseconds: 300),
        height: 60,
          items: [
            Icon(Icons.home_rounded,size: 20,),
            Icon(Icons.search_rounded,size: 20,),
            Icon(Icons.favorite_rounded,size: 20,),
            Icon(Icons.account_circle_rounded,size: 20,),
          ],
        backgroundColor: Colors.transparent,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
      ),
    );
  }
}



