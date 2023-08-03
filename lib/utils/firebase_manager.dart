

import 'package:intl/intl.dart';

class FirebaseManager{
  static String convertDateToStringReadable(DateTime date){
    return DateFormat('yyyy-MM-dd HH:mm').format(date).toString();
  }
}
