import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_house/models/appointmentModel.dart';
import 'package:rent_house/models/notificationAlert.dart';
import 'package:rent_house/theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  String toUser;
  String titolo;

  AppointmentScreen({required this.toUser, required this.titolo});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String myId = FirebaseAuth.instance.currentUser!.uid;
  String name = FirebaseAuth.instance.currentUser!.displayName!;
  String email = FirebaseAuth.instance.currentUser!.email!;
  DateTime _selectedDate = DateTime.now();

  //TimeOfDay _selectedTime = TimeOfDay.now();
  int _selectedAvailableTime = 0;
  List<String> availableTimes = [
    '9:00',
    '10:00',
    '11:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    // Aggiungi altri orari disponibili
  ];

  Future<void> addAppointmentToCollection() async {
    int h = int.parse(availableTimes[_selectedAvailableTime].split(":")[0]);
    int m = int.parse(availableTimes[_selectedAvailableTime].split(":")[1]);

    Map<String, dynamic> data = UserAppointment(
            id: "",
            idUser: this.widget.toUser,
            confirmed: false,
            date: DateTime(_selectedDate.year, _selectedDate.month,
                _selectedDate.day, h, m),
            titolo: this.widget.titolo,
            createdBy: email)
        .toJson();

    String idApp="";
    _firestore
        .collection('Appointments')
        .add(data)
        .then((DocumentReference documentRef) {
      // Get the generated document ID
      String documentId = documentRef.id;
      idApp=documentId;
      // Update the document with the ID
      documentRef.update({'id': documentId}).then((_) {
        print('Document added with ID: $documentId');
      }).catchError((error) {
        print('Failed to update document with ID: $documentId');
      });
    }).catchError((error) {
      print('Failed to add document: $error');
    });

    Map<String, dynamic> dataNotify = NotificationAlert(
        message: "Appuntamento ricevuto per il giorno :"+data['date'].toString()+ " da: "+
            name+ " con email: "+email,
        date: DateTime.now(),
        toUser: this.widget.toUser,
        id: "id",
        fromUser: email,
        appId: idApp,
    )
        .toJson();
    _firestore
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

  void _onSelectDate(DateTime day, DateTime focusDay) {
    setState(() {
      _selectedDate = day;
    });
  }

  /*void _selectTime() {
    DatePicker.showTimePicker(
      context,
      showSecondsColumn: false,
      onConfirm: (time) {
        setState(() {
          _selectedTime = DateTime.now() as TimeOfDay;
        });
      },
    );
  }*/

  void _showBottomPop() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeOut,
          )),
          child: Container(
            height: 200, // Altezza del pop dal basso
            child: Align(
              alignment: Alignment.bottomCenter,
              child: // Contenuto del pop dal basso
                  Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  child: Column(
                    children: [
                      Text('Vuoi fissare un appuntamento per il giorno\n ' +
                          _selectedDate.day.toString() +
                          "/" +
                          _selectedDate.month.toString() +
                          "/" +
                          _selectedDate.year.toString() +
                          " alle ore: " +
                          availableTimes[_selectedAvailableTime]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              // Text color
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(purpleColor),
                              // Button background color
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold), // Text style
                              ),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 24.0), // Padding
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0)), // Button shape
                              ),
                            ),
                            onPressed: () {
                              addAppointmentToCollection();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              // Text color
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(purpleColor),
                              // Button background color
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold), // Text style
                              ),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 24.0), // Padding
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0)), // Button shape
                              ),
                            ),
                            onPressed: () {
                              // Cancel or dismiss the confirmation dialog
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                        ],
                      )
                      // Altri widget desiderati
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleziona la data e l\'orario dell\'appuntamento'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TableCalendar(
                headerStyle: HeaderStyle(formatButtonVisible: false),
                calendarFormat: CalendarFormat.month,
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
                onDaySelected: _onSelectDate,
                focusedDay: _selectedDate,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 3, 14)),
            SizedBox(height: 20),
            Text(
              "Seleziona un orario disponibile",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 180,
                //onPressed: _selectTime,
                child: GridView.builder(
                  itemCount: availableTimes.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      child: Text(availableTimes[index]),
                      onPressed: () {
                        setState(() {
                          _selectedAvailableTime = index;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: _selectedAvailableTime == index
                            ? MaterialStateProperty.all<Color>(purpleColor)
                            : MaterialStateProperty.all<Color>(Colors.blueGrey),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, // Numero di colonne desiderate
                    crossAxisSpacing:
                        8.0, // Spaziatura orizzontale tra i pulsanti
                    mainAxisSpacing: 8.0, // Spaziatura verticale tra i pulsanti
                  ),
                )
                //Text('Seleziona l\'orario'),
                ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                child: Text("Conferma prenotazione"),
                onPressed: () {
                  _showBottomPop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
