import 'package:flutter/material.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';
import 'package:rent_house/widgets/your_rent_card.dart';

import '../widgets/around_card.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';

class ProfileScreen extends StatefulWidget {
  const  ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: slider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Text(
              "Your profile",
              style: primaryTitle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child :ListTile(
              contentPadding: const EdgeInsets.all(1),
              title: Text(
                "Le tue informazioni personali",
                style: secondaryTitle,
              ),
              subtitle: Text("Nome: Cosimo \nCognome Manisi\nLavoro : manco per un sogno", style: descText,),
              trailing: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/owner1.png"),backgroundColor: Colors.transparent,),
            ),

          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "I tuoi annunci",
              style: secondaryTitle,
            ),
          ),
          RentHouse(
            imageUrl: "assets/images/house1.png",
            title: "Wooden House",
            city: "Bandung",
            rating: 4,
          ),
          SizedBox(height: 10),
          RentHouse(
            imageUrl: "assets/images/house2.png",
            title: "Wooden House",
            city: "Bogor",
            rating: 5,
          ),
          SizedBox(height: 10),

          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}