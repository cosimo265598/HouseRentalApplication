import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  int currentIndex = 1;
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
        child: _pages[currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: onSelectedIndexFloatingActionButton(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: purpleColor,
        index: currentIndex,
        color: Colors.grey.shade200,
        animationDuration: Duration(milliseconds: 300),
        height: 60,
        items: [
          FaIcon(FontAwesomeIcons.home,),
          FaIcon(FontAwesomeIcons.search,),
          FaIcon(FontAwesomeIcons.heartCircleCheck,),
          FaIcon(FontAwesomeIcons.solidCircleUser,)
        ],
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  Widget? onSelectedIndexFloatingActionButton(int index) {
    if( index==1 ){
      return FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => GoogleMapsScreen()));
        },
        backgroundColor: purpleColor,
        label: Text("Map view"),
        icon: Icon(Icons.map_sharp),
        heroTag: "btn1",
      );
    }
    else if (index==3){
      return FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ChatPage()));
        },
        backgroundColor: purpleColor,
        label: Text("Le mie chat"),
        icon: Icon(Icons.message_outlined),
        heroTag: "btn1",
      );
    }
    return null;
  }
}
