import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_page.dart';


class FacebookSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.facebookF, color: Colors.blue),
              Text(
                'Sign In With Facebook',
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
          },
        ),
      );
}
