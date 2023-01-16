//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: AssetImage(""),
          ),
          SizedBox(height: 8),
          Text(
            'Name: ' ,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' ,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {

            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}
