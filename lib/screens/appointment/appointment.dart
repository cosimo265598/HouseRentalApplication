import 'package:rent_house/theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _selectedAvailableTime =0;
  List<String> availableTimes = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    // Aggiungi altri orari disponibili
  ];
  void _onSelectDate (DateTime day, DateTime focusDay){
    setState(() {
      _selectedDate=day;
    });
  }
  void _selectTime() {
    DatePicker.showTimePicker(
      context,
      showSecondsColumn: false,
      onConfirm: (time) {
        setState(() {
          _selectedTime = DateTime.now() as TimeOfDay;
        });
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
                selectedDayPredicate: (day) => isSameDay(day,_selectedDate),
                onDaySelected: _onSelectDate,
                focusedDay: _selectedDate,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030,3,14)
              ),
              SizedBox(height: 20),
              Text(
                "Seleziona un orario disponibile",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20,),
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
                          _selectedAvailableTime=index;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: _selectedAvailableTime==index ? MaterialStateProperty.all<Color>(purpleColor) : MaterialStateProperty.all<Color>(Colors.blueGrey),
                      ),
                    );
                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // Numero di colonne desiderate
                  crossAxisSpacing: 8.0, // Spaziatura orizzontale tra i pulsanti
                  mainAxisSpacing: 8.0, // Spaziatura verticale tra i pulsanti
                ),
                )
                //Text('Seleziona l\'orario'),
              ),
              ElevatedButton(
              child: Text("Conferma prenotazione"),
              onPressed: () {
                // Esegui l'azione quando viene selezionato un orario
              },
            ),

            ],
          ),
      ),

    );
  }
}