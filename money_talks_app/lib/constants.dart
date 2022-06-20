import 'dart:ui';

import 'package:money_talks_app/style.dart';
import 'package:flutter/material.dart';

Color kAffPurple = const Color(0xFF1F1A30);
Color kAffPurpleLight = const Color(0xFF592A51);
Color kAffPurpleLight01 = const Color(0xFFa17a9a);

Color kAffRed = const Color(0xFFE46472);
Color kAffGreenAccent = const Color(0xFF0DF5E4);

String kUrl = 'http://212.227.203.79:8080/moneytalks-service';

String getDayFromWeekDay(int weekDay){
  switch(weekDay){
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return 'Error retrieve week day';
  }
}

String getDayFromWeekDayTrim(int weekDay){
  switch(weekDay){
    case 1:
      return 'Lun';
    case 2:
      return 'Mar';
    case 3:
      return 'Mer';
    case 4:
      return 'Gio';
    case 5:
      return 'Ven';
    case 6:
      return 'Sab';
    case 7:
      return 'Dom';
    default:
      return 'Error retrieve week day';
  }
}

bool isToday(int delivery_date) {
  DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(delivery_date);
  DateTime now = DateTime.now();
  bool result = false;

  if (currentDate.day == now.day &&
      currentDate.month == now.month &&
      currentDate.year == now.year) {
    result = true;
  }
  return result;
}

String getMonthFromMonthNumber(int month, bool prefix){
  switch(month){
    case 1:
      return !prefix ? 'January' : 'Jan';
    case 2:
      return !prefix ? 'February' : 'Feb';
    case 3:
      return !prefix ? 'March' : 'Mar';
    case 4:
      return !prefix ? 'April' : 'Apr';
    case 5:
      return !prefix ? 'May' : 'May';
    case 6:
      return !prefix ? 'June' : 'Jun';
    case 7:
      return !prefix ? 'July' : 'Jul';
    case 8:
      return !prefix ? 'August' : 'Aug';
    case 9:
      return !prefix ? 'September' : 'Sept';
    case 10:
      return !prefix ? 'October' : 'Oct';
    case 11:
      return !prefix ? 'November' : 'Nov';
    case 12:
      return !prefix ? 'December' : 'Dec';
    default:
      return 'Error retrieve week day';
  }
}


String getItalianMonthFromMonthName(String month){
  switch(month){
    case 'january':
      return 'Gennaio';
    case 'february':
      return 'Febbraio';
    case 'march':
      return 'Marzo';
    case 'april':
      return 'Aprile';
    case 'may':
      return 'Maggio';
    case 'june':
      return 'Giugno';
    case 'july':
      return 'Luglio';
    case 'august':
      return 'Agosto';
    case 'september':
      return 'Settembre';
    case 'october':
      return 'Ottobre';
    case 'november':
      return 'Novembre';
    case 'december':
      return 'Dicembre';
    default:
      return month;
  }
}

SnackBar buildErrorSnackBar(String message){

  final snackBar = SnackBar(
    elevation: 10.0,
    backgroundColor: kAffRed,
    behavior: SnackBarBehavior.floating,
    content: Text(
      message,
      style: textStyleCustomWhite,
    ),
  );

  return snackBar;
}
