import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rent_house/models/houseModel.dart';
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
import 'package:google_nav_bar/google_nav_bar.dart';
import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  int currentIndex = 0;
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
        child: TopBar(
          imageUser: currentUser.photoURL!,
        ),
      ),
      body: SafeArea(
          child: _pages[currentIndex],
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: onSelectedIndexFloatingActionButton(currentIndex),
      bottomNavigationBar: GNav(
        rippleColor: Colors.blueGrey, // tab button ripple color when pressed
        backgroundColor: Colors.grey.withAlpha(30),
        haptic: true, // haptic feedback
        gap: 8, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        activeColor: purpleColor, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: purpleColor.withOpacity(0.1), // selected tab background color
        //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        onTabChange: (index){
          setState(() {
            currentIndex = index;
          });
        },
        tabs: const [
        GButton(icon: Icons.home, text: "Home",),
        GButton(icon: Icons.search, text: "Cerca",),
        GButton(icon: Icons.notifications, text: "Notification",),
        GButton(icon: Icons.account_circle_rounded, text: "Profilo",),
      ],

      )

      /*CurvedNavigationBar(
        buttonBackgroundColor: purpleColor,
        index: currentIndex,
        color: Colors.grey.shade200,
        animationDuration: Duration(milliseconds: 300),
        height: 60,
        items: [
          FaIcon(
            FontAwesomeIcons.home,
          ),
          FaIcon(
            FontAwesomeIcons.search,
          ),
          FaIcon(
            FontAwesomeIcons.bell,
          ),
          FaIcon(
            FontAwesomeIcons.circleUser,
          )
        ],
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),*/
    );
  }

  Widget? onSelectedIndexFloatingActionButton(int index) {
    if (index == 1) {
      return FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => GoogleMapsScreen()));
        },
        backgroundColor: purpleColor,
        label: Text("Map view"),
        icon: Icon(Icons.map_sharp),
        heroTag: "btn1",
      );
    } else if (index == 3) {
      return FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ChatPage()));
        },
        backgroundColor: purpleColor,
        label: Text("Le mie chat"),
        icon: Icon(Icons.message_outlined),
        heroTag: "btn1",
      );
    }
    return null;
  }

  Stream<List<House>> readHouse() =>
    FirebaseFirestore.instance.collection('Houses').snapshots().map((snap) =>
        snap.docs.map((doc)=> House.fromJson(doc.data()) ).toList());

  Widget buildExample(House h) => ListTile(
        title: Text(h.titolo),
        subtitle: Text(h.description),
      );
}
