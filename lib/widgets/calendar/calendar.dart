import 'package:flutter/material.dart';
import 'package:scedu/widgets/calendar/calendar_day.dart';
import 'package:scedu/widgets/calendar/calendar_grid_delegate.dart';

class Calendar extends StatelessWidget {
  final int year;
  final int month;

  const Calendar(this.year, this.month, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int month = 1;
    int year = 2022;

    DateTime firstOfMonth = DateTime(year, month);
    int startIndex = firstOfMonth.weekday - 1;

    DateTime lastOfMonth = DateTime(year, month + 1, 0);

    int totalItems = startIndex + lastOfMonth.day;
    totalItems += 7 - totalItems % 7;
    int rows = totalItems ~/ 7;

    return GridView.builder(
      gridDelegate: CalendarGridDelegate(rows: rows, cols: 7),
      itemBuilder: (context, index) =>
          CalendarDay(firstOfMonth.add(Duration(days: index - startIndex))),
      itemCount: rows * 7,
    );
  }
}
