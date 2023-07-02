import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/models/chatMessageModel.dart';
import 'package:rent_house/models/houseModel.dart';
import 'package:rent_house/models/user.dart';
import 'package:rent_house/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/chatUserModel.dart';
import 'conversationList.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: purpleColor.withOpacity(0.8),
      ),
      body: SafeArea(
          child: StreamBuilder<List<String>>(
              stream: conversationsOfUser(_auth),
              builder: (BuildContext context, snapshot)  {
              if (snapshot.hasError)
                return Text("Error connection");
              else if (snapshot.hasData) {
                final conversation = snapshot.data;
                //replicateData();
                return ListView(
                  padding: EdgeInsets.only(bottom: 10),
                  scrollDirection: Axis.vertical,
                  children: conversation!.map(buildExample2).toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
          },

),

      ),
    );
  }
  Stream<List<String>> conversationsOfUser(FirebaseAuth _auth ) {
    return _firestore.collection('Chats').snapshots().map((snap) =>
        snap.docs.map((doc) => doc.id.toString().split(_auth.currentUser!.uid).join(""))
            .toList());

  }

  Future<UserRegistered> mapIdToUserRegistered(String idchatUser)  async {
    DocumentSnapshot snapshot = await _firestore.collection('Users').doc(idchatUser).get();
    if (snapshot.exists ) {
      UserRegistered userRegistered = UserRegistered.fromJson(snapshot.data()! as Map<String,dynamic>);
      return userRegistered;
    } else {
      throw Exception('User not found');
    }
  }

  Widget buildExample2(String idchat)    {
    List<String> sortedIds = [_auth.currentUser!.uid,idchat]..sort();
     sortedIds.join();
    return FutureBuilder<UserRegistered>(
      future: mapIdToUserRegistered(idchat),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          UserRegistered userRegistered = snapshot.data!;
          return Conversation(
            name: userRegistered.displayName,
            messageText: userRegistered.online.toString().contains("true") ? "Online" : "Offline",
            imageUrl: userRegistered.photoUrl,
            time: "now",
            isMessageRead: true,
            idChatRoom: sortedIds.join(),
          );
        } else {
          // Handle the case when the user is not found
          return Container();
        }
      },
    );
  }

}


