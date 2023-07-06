import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rent_house/screens/create_house/add_new_house_for_rent.dart';
import 'package:rent_house/screens/detail_page.dart';
import 'package:rent_house/theme.dart';
import 'package:rent_house/widgets/around_card.dart';
import 'package:rent_house/widgets/bottom_nav_bar.dart';
import 'package:rent_house/widgets/top_bar.dart';
import 'package:rent_house/widgets/your_rent_card.dart';

import '../models/houseModel.dart';
import '../widgets/filter_categories.dart';
import '../widgets/slide_card.dart';
import 'login/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const  ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentUser= FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<Widget> getAllHousesGivenIdOfUser() async {
    var collection = _firestore.collection('House');
    var querySnapshot = await collection.where('agentId', isEqualTo: currentUser.uid).get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var document in querySnapshot.docs) {
        var data = document.data();
        print(data);
      }
      return Container();
    } else {
      return Container();
      // Handle the case when there are no documents found
    }
  }

  Widget createWidgetRentHouse(House h) => PreviewCard(house: h,);

  Stream<List<House>> readHouse() =>
      FirebaseFirestore.instance.collection('Houses').where('agendId', isEqualTo: currentUser.uid).snapshots().map((snap) =>
          snap.docs.map((doc)=> House.fromJson(doc.data()) )
              .toList());

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
              subtitle: Text(currentUser.displayName.toString()+"\nEmail: "+currentUser.email.toString(), style: descText,),
              trailing: OutlinedButton(
                child: FaIcon(Icons.exit_to_app_outlined, color: Colors.red),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(60, 60),
                  side: BorderSide(width: 2, color: Colors.red),
                  shape:  CircleBorder(),//MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: () {
                  //logout account
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
              )/*CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(currentUser.photoURL!),backgroundColor: Colors.transparent,)*/,
            ),

          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Container(
              padding: EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FaIcon(FontAwesomeIcons.house, color: purpleColor),
                        Text(
                          'Aggiungi annuncio',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: purpleColor),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith((states) => const Size.fromHeight(55.0)),
                      //maximumSize: MaterialStateProperty.resolveWith((states) => const Size(280,55.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () {
                      //logout account
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AddNewHouseForRent()));
                    },
                  )
                ],
              ),

            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "I tuoi annunci",
              style: secondaryTitle,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 400,
            child: StreamBuilder<List<House>>(
              stream: readHouse(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError)
                  return Container();
                else if (snapshot.hasData) {
                  final house = snapshot.data;
                  print(house);
                  return ListView(
                    padding: EdgeInsets.only(bottom: 10),
                    scrollDirection: Axis.vertical,
                    children: house!.map(createWidgetRentHouse).toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}