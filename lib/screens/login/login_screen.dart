import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
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
              return HomePage();
            } else if (snapshot.hasError) {
              return Center(child: Text("Error connection!",style: primaryTitle,));
            } else {
              return SignUpWidget();
            }
          }
        )
    )

  );

}
