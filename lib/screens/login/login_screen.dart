import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rent_house/screens/appointment/appointment.dart';
import 'package:rent_house/screens/home_page.dart';
import 'package:rent_house/screens/login/google_sign_in.dart';
import 'package:rent_house/screens/login/sign_up_widget.dart';
import 'package:rent_house/theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: ChangeNotifierProvider(
        create: (BuildContext context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider= Provider.of<GoogleSignInProvider>(context);
            if (provider.isSigningIn) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              checkUser();
              return HomePage(); //AppointmentScreen();
            } else if (snapshot.hasError) {
              return Center(child: Text("Error connection!",style: primaryTitle,));
            } else {
              return SignUpWidget();
            }
          }
        )
    )

  );

  void checkUser(){
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore.instance.collection('Users').snapshots().map((snap) =>
        snap.docs.map((doc) => doc.id == _auth.currentUser!.uid)).length.then((value) {
      if (value > 0) {
        FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid.toString()).update({'online': true});
      }
      else{
        FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid.toString()).set(
            {'displayName':_auth.currentUser!.displayName.toString(),
              'email': _auth.currentUser!.email,
              'photoUrl': _auth.currentUser!.photoURL,
              'online': true});
      }
    }
    );
  }
}
