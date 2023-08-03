

import 'package:intl/intl.dart';

class Utility{

  static String convertDateToStringReadable(DateTime date){
    return DateFormat('yyyy-MM-dd HH:mm').format(date).toString();
  }
}
