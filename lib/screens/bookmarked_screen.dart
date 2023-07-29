import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:rent_house/models/notificationAlert.dart';

class BookmarkedScreen extends StatefulWidget {
  const BookmarkedScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkedScreen> createState() => _BookmarkedScreenState();
}

class _BookmarkedScreenState extends State<BookmarkedScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<NotificationAlert>> readNotificationUser() =>
      _firestore.collection('Notifications').where('toUser',isEqualTo: _auth.currentUser!.email)
          //.orderBy('date', descending: true)
          .snapshots().map((snap) =>
          snap.docs.map((doc) =>
              NotificationAlert.fromJson(doc.data()))
              .toList()
      );

  void deleteNotificationUser(NotificationAlert notificationAlert) =>
      _firestore.collection('Notifications').doc(notificationAlert.id).delete();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: slider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "Notifice ricevute",
              style: secondaryTitle,
            ),
          ),
          Container(
              child: StreamBuilder<List<NotificationAlert>>(
                stream: readNotificationUser(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasError)
                    return Text("Error conncetion to DB");
                  else if (snapshot.hasData) {
                    final notify = snapshot.data;
                    //replicateData();
                    return Column(
                      //padding: EdgeInsets.only(bottom: 10),
                      //scrollDirection: Axis.horizontal,
                      children: notify!.map(buildExample).toList(),
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
  Widget buildExample(NotificationAlert h) =>
      Slidable(
          endActionPane:  ActionPane(
            motion: ScrollMotion(),
            children: [
              /*Center(
                //color: Color(0xFFFE4A49),
                  child: TextButton(onPressed: (){}, child: Text("Elimina"))),*/
              SlidableAction(
                // An action can be bigger than the others.
                autoClose: true,
                flex: 3,
                onPressed: (value) {
                  deleteNotificationUser(h);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Elimina',
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(Icons.notification_important_outlined, size: 40),
            title: Text(h.message,style: secondaryTitle,),
            subtitle: Text( DateFormat('yyyy-MM-dd HH:mm').format(h.date).toString(),style: infoSecondaryTitle,),
            trailing: Icon(Icons.arrow_back, size: 20),
          )
      );
}

