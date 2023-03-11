import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_house/screens/home_page.dart';
import 'package:rent_house/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/houseModel.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  replicateData();
  runApp(MyApp());
}

Future<void> replicateData () async {
  var collection = FirebaseFirestore.instance.collection('Houses');
  var docSnapshot = await collection.doc('0OsJF5kU5RrBTwFvnlaF').get();
  if (docSnapshot.exists) {

    Map<String, dynamic>? data = docSnapshot.data();
    //print(data); // <-- The value you want to retrieve.
    var newDoc= collection.doc();  // create new id of document
    String id = newDoc.id;
    data!['idDocument']=id.toString();
    data!['agentId']= FirebaseAuth.instance.currentUser!.toString();
    newDoc.set(data!);
    // Call setState if needed.
  }
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: LoginPage()
    );
  }

}