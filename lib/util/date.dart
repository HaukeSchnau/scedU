import 'package:intl/intl.dart';

int numOfWeeks(int year) {
  DateTime dec28 = DateTime(year, 12, 28);
  int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
  return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
}

extension Date on DateTime {
  DateTime toDate() {
    return DateTime(year, month, day);
  }

  DateTime toMonth() {
    return DateTime(year, month);
  }

  DateTime withTime({required int hour, int minute = 0}) {
    return DateTime(year, month, day, hour, minute);
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int get weekNumber {
    int dayOfYear = int.parse(DateFormat("D").format(this));
    int woy = ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(year - 1);
    } else if (woy > numOfWeeks(year)) {
      woy = 1;
    }
    return woy;
  }
}
