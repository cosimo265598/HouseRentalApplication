import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rent_house/screens/home_page.dart';

import 'google_sign_in.dart';


class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.google, color: Colors.red),
              Text(
                'Sign In With Google',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.resolveWith((states) => const Size(200,55.0)),
            maximumSize: MaterialStateProperty.resolveWith((states) => const Size(280,55.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
          ),
          onPressed: () {
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      );
}
