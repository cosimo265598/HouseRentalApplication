import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/models/appointmentModel.dart';
import 'package:rent_house/utils/utility.dart';

import '../../models/notificationAlert.dart';
import '../../theme.dart';

class AppointmentCard extends StatelessWidget {
  final UserAppointment appointment;

  AppointmentCard({
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey.withAlpha(20),
            ),
            child:
                Expanded(
                  child: ListTile(
                    title: Text(appointment.titolo),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Utility.convertDateToStringReadable(appointment.date)),
                        Text(appointment.idUser)
                      ],
                    ),
                    trailing: confimation(appointment),
                  ),
                ),
          ),
    );
  }

  void confirmAppointment(String documentId) {
    FirebaseFirestore.instance
        .collection('Appointments')
        .doc(documentId)
        .update({'confirmed': true}).then((_) {
      print('Field updated successfully!');
    }).catchError((error) {
      print('Failed to update field: $error');
    });
    Map<String, dynamic> dataNotify = NotificationAlert(
        message: "Appuntamento confermato per il giorno: "+Utility.convertDateToStringReadable(this.appointment.date),
        date: DateTime.now(),
        toUser: this.appointment.createdBy,
        id: "id",
        fromUser: this.appointment.idUser,
        appId: '')
        .toJson();
    FirebaseFirestore.instance
        .collection('Notifications')
        .add(dataNotify)
        .then((DocumentReference documentRef) {
      // Get the generated document ID
      String documentId = documentRef.id;
      // Update the document with the ID
      documentRef.update({'id': documentId}).then((_) {
        print('Document added with ID: $documentId');
      }).catchError((error) {
        print('Failed to update document with ID: $documentId');
      });
    }).catchError((error) {
      print('Failed to add document: $error');
    });
  }


  void deleteAppointment(String documentId) {
    FirebaseFirestore.instance
        .collection('Appointments')
        .doc(documentId)
        .delete();
    Map<String, dynamic> dataNotify = NotificationAlert(
        message: "Appuntamento cancellato per il giorno: "+Utility.convertDateToStringReadable(this.appointment.date),
        date: DateTime.now(),
        toUser: this.appointment.createdBy,
        id: "id",
        fromUser: this.appointment.idUser,
        appId: '')
        .toJson();
    FirebaseFirestore.instance
        .collection('Notifications')
        .add(dataNotify)
        .then((DocumentReference documentRef) {
      // Get the generated document ID
      String documentId = documentRef.id;
      // Update the document with the ID
      documentRef.update({'id': documentId}).then((_) {
        print('Document added with ID: $documentId');
      }).catchError((error) {
        print('Failed to update document with ID: $documentId');
      });
    }).catchError((error) {
      print('Failed to add document: $error');
    });
  }

  Widget confimation(UserAppointment appointment) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (appointment.createdBy != _auth.currentUser!.email)
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          checkConfirmedYes(appointment, purpleColor),
          checkConfirmedNo(appointment, Colors.red),
        ],
      );
    else {
      if (appointment.confirmed)
        return Icon(Icons.domain_verification_outlined, color: Colors.lightGreen,);
      else
        return Icon(Icons.pending_actions_outlined, color: Colors.amber);
    }
  }

  Widget checkConfirmedYes(UserAppointment appointment, Color colors) {
    if (!appointment.confirmed)
      return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // Text color
          backgroundColor: MaterialStateProperty.all<Color>(purpleColor),
          // Button background color
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.bold), // Text style
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Padding
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)), // Button shape
          ),
        ),
        onPressed: () {
          confirmAppointment(appointment.id);
        },
        child: Text('Yes'),
      );
    else
      return Container();
  }

  Widget checkConfirmedNo(UserAppointment appointment, Color colors) {
    if (appointment.confirmed)
      return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // Text color
          backgroundColor: MaterialStateProperty.all<Color>(colors),
          // Button background color
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.bold), // Text style
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Padding
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)), // Button shape
          ),
        ),
        onPressed: () {
          // Cancel or dismiss the confirmation dialog
          deleteAppointment(appointment.id);
        },
        child: Text('Delete'),
      );
    else
      return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // Text color
          backgroundColor: MaterialStateProperty.all<Color>(purpleColor),
          // Button background color
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.bold), // Text style
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Padding
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)), // Button shape
          ),
        ),
        onPressed: () {
          // Cancel or dismiss the confirmation dialog
          deleteAppointment(appointment.id);
        },
        child: Text('No'),
      );
  }
}
